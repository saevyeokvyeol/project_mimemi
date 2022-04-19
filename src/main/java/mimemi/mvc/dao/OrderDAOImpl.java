package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.AddrDTO;
import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;
import mimemi.mvc.paging.OrderListPageCnt;
import mimemi.mvc.util.DbUtil;

public class OrderDAOImpl implements OrderDAO {
	private Properties proFile = new Properties();
	
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public OrderDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 주문 등록
	 * 0. OrderDTO 안의 OrderLineDTO를 통해 상품의 총 구매 금액 구하기
	 * 1. 주문 테이블 insert
	 * 2. 새 주소로 구매한 경우 addr insert
	 * 3. 적립금을 사용한 경우 회원 테이블에서 적립금 차감(update)
	 * 4. 회원 테이블에 적립금 1% 적립(update)
	 * 5. 주문 상세 insert
	 * 6. 쿠폰 사용한 경우 쿠폰 사용 여부 변경(update)
	 * 7. 장바구니에 담겨있었을 경우 장바구니 부분 삭제
	 * 
	 * 위의 모든 걸 트랜잭션으로 처리
	 * 
	 * @param OrderDTO(String userId, int addrId, String payMethod, int payPoint, String orderMemo,
	 * 			String takeMethod, String doorPwd, String usercouId)
	 * @return int(등록된 데이터 수)
	 * @throws ParseException 
	 */
	@Override
	public int insertOrder(OrderDTO order, String mode) throws SQLException, ParseException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.insertOrder");
		// insert into orders values(ORDERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		// userId, addId, payMethod, payPoint, totalPrice, orderMemo, takeMethod, enderPwd,
		// usercouId
		int result = 0;
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false); // 자동 커밋 해제
			
			// 주문 등록
			ps = con.prepareStatement(sql);
			ps.setString(1, order.getUserId());
			ps.setInt(2, order.getAddrId());
			ps.setString(3, order.getPayMethod());
			ps.setInt(4, order.getPayPoint());
			
			int totalPrice = calTotalPrice(order.getCartList());
			ps.setInt(5, totalPrice);
			ps.setString(6, order.getOrderMemo());
			ps.setString(7, order.getTakeMethod());
			ps.setString(8, order.getEnterPwd());
			
			if(order.getUsercouId() == 0) {
				ps.setString(9, null);
			} else {
				ps.setInt(9, order.getUsercouId());
			}
			
			result = ps.executeUpdate();
			
			// 주소 저장: 나중에 주소 체크 메소드랑 비교~~
			if(order.getAddrId() == 0) {
				if(this.insertAddr(con, order.getAddr()) == 0) {
					throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
				}
			}
			
			// 적립금 차감
			if(order.getPayPoint() > 0) {
				if(this.decreamentUserPoint(con, order.getUserId(), order.getPayPoint()) == 0) {
					throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
				}
			}
			
			// 적립금 적립
			int pointPlus = totalPrice / 100;
			if(this.increamentUserPoint(con, order.getUserId(), pointPlus) == 0) {
				throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
			}
			
			// 주문 상세 인서트
			int[] re = this.insertOrderLine(con, order.getCartList());
			for(int r : re) {
				if(r == 0) {
					throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
				}
			}
			
			// 쿠폰 사용 여부 변경
			if(order.getUsercouId() != 0) {
				if(this.updateUserCoupon(con, order.getUsercouId()) == 0) {
					throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
				}
			}
			
			// 해당 장바구니 삭제
			if(mode.equals("C") || mode.equals("S")) {
				for(CartDTO c : order.getCartList()) {
					if(this.deleteSelectedCart(con, c.getCartId()) == 0) {
						throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
					}
				}
			}
			
			con.commit();
		} finally {
			con.rollback();
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 총 금액 계산
	 * */
	private int calTotalPrice(List<CartDTO> list) {
		int totalPrice = 0;
		for(CartDTO c : list) {
			int weekday = 0;
			int period = Integer.parseInt(c.getCartPeriod().substring(0, 1));
			
			if(c.getCartWeekday().equals("T")) {
				weekday = 3;
			} else {
				weekday = 5;
			}
			
			
			totalPrice += c.getCartQty() * c.getGoodsPrice() * weekday * period;
		}
		return totalPrice;
	}

	/**
	 * 2. 새 주소로 구매한 경우 addr insert
	 * @param Connection con, AddrDTO addr
	 * @return int(등록된 데이터 수)
	 * */
	@Override
	public int insertAddr(Connection con, AddrDTO addr) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.insertOrder");
		// insert into orders values(ORDERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		int result = 0;
		return 0;
	}

	/**
	 * 3. 적립금을 사용한 경우 회원 테이블에서 적립금 차감(update)
	 * @param String userId, int usedPoint
	 * @return int(수정된 데이터 수)
	 * */
	@Override
	public int decreamentUserPoint(Connection con, String userId, int usedPoint) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.decreamentUserPoint");
		// update users set user_point = user_point - ? where USER_ID = ?
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, usedPoint);
			ps.setString(2, userId);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	/**
	 * 4. 회원 테이블에 적립금 1% 적립(update)
	 * @param String userId, int addedPoint
	 * @return int(수정된 데이터 수)
	 * */
	@Override
	public int increamentUserPoint(Connection con, String userId, int addedPoint) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.increamentUserPoint");
		// update users set user_point = user_point + ? where USER_ID = ?
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, addedPoint);
			ps.setString(2, userId);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	/**
	 * 5. 주문 상세 insert
	 * @param Connection con, OrderLineDTO orderLine
	 * @return int(등록된 데이터 수)
	 * @throws ParseException 
	 * */
	@Override
	public int[] insertOrderLine(Connection con, List<CartDTO> list) throws SQLException, ParseException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.insertOrderLine");
		// insert into order values(ORDER_LINE_ID_SEQ.NEXTVAL, orders_seq.currval, ?, ?, ?, ?, ?, ?)
		int[] result = null;
		try {
			ps = con.prepareStatement(sql);
			for(CartDTO c : list) {
				ps.setString(1, c.getGoodsId());
				ps.setInt(2, c.getCartQty());
				
				int weekday = 0;
				int period = Integer.parseInt(c.getCartPeriod().substring(0, 1));
				
				if(c.getCartWeekday().equals("T")) {
					weekday = 3;
				} else {
					weekday = 5;
				}
				
				int totalPrice = c.getCartQty() * c.getGoodsPrice() * weekday * period;
				
				ps.setInt(3, totalPrice);
				ps.setString(4, c.getCartWeekday());
				ps.setString(5, c.getCartPeriod());
				ps.setString(6, c.getCartStart().substring(0, 10));
				System.out.println(c.getGoodsId());
				System.out.println(c.getCartQty());
				System.out.println(totalPrice);
				System.out.println(c.getCartWeekday());
				System.out.println(c.getCartPeriod());
				System.out.println(c.getCartStart().substring(0, 10));
				
				ps.addBatch();
				ps.clearParameters();
			}
			
			result = ps.executeBatch();
			int count = list.size();
			
			for(CartDTO c : list) {
				count--;
				
				int weekday = 0;
				int period = Integer.parseInt(c.getCartPeriod().substring(0, 1));
				
				if(c.getCartWeekday().equals("T")) {
					weekday = 3;
				} else {
					weekday = 5;
				}
				
				int totalPrice = c.getCartQty() * c.getGoodsPrice() * weekday * period;
				int totalDeli = period * weekday;

				Calendar cal = Calendar.getInstance();
		        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		        cal.setTime(df.parse(c.getCartStart()));
		        int wd = 0;
				while(totalDeli > 0){
					wd = cal.get(Calendar.DAY_OF_WEEK);
					if(wd == 2 || wd == 4 || wd == 6) {
						if(this.insertOrderDeli(con, df.format(cal.getTime()), count) == 0) {
							throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
						}
						if(c.getCartWeekday().equals("F") && (wd == 3 || wd == 5)) {
							if(this.insertOrderDeli(con, df.format(cal.getTime()), count) == 0) {
								throw new SQLException("주문이 정상적으로 완료되지 않았습니다.\\n잠시 후 다시 시도해주세요.");
							}
						}
						totalDeli--;
					}
					cal.add(Calendar.DATE, 1);
				}
			}
			
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}
	
	/**
	 * 주문 상세 배송 등록
	 * */
	private int insertOrderDeli(Connection con, String orderDeliDate, int count) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.insertOrderDeli");
		// insert into order values(ORDER_LINE_ID_SEQ.NEXTVAL, orders_seq.currval, ?, ?, ?, ?, ?, ?)
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, count);
			ps.setString(2, orderDeliDate);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	/**
	 * 6. 쿠폰 사용한 경우 쿠폰 사용 여부 변경(update)
	 * @param Connection con, int userCouId
	 * @return int(수정된 데이터 수)
	 * */
	@Override
	public int updateUserCoupon(Connection con, int userCouId) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.updateUserCoupon");
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, userCouId);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	/**
	 * 7. 장바구니에 담겨있었을 경우 해당 장바구니 삭제
	 * @param int userId, String goodsId
	 * @return int(삭제한 레코드 수)
	 * */
	@Override
	public int deleteSelectedCart(Connection con, int cardId) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.deleteSelectedCart");
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cardId);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	/**
	 * 주문 취소
	 * : 주문 번호를 이용해 해당 주문 건에 연관된 모든 배송 스케줄을 취소 처리함
	 * @param int orderId
	 * @return int(수정한 레코드 수)
	 */
	@Override
	public int deleteOrder(int orderId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.deleteOrder");
		int result = 0;
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderId);
			result = ps.executeUpdate();
			
			int[] re = deleteOrderLine(con, orderId);
			for(int r : re) {
				if(r == 0) {
					throw new SQLException();
				}
			}
			
			re = deleteOrderDeil(con, orderId);
			for(int r : re) {
				if(r == 0) {
					throw new SQLException();
				}
			}
			con.commit();
		} finally {
			con.rollback();
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 주문을 취소했을 때 주문 상세까지 전부 취소
	 * */
	public int[] deleteOrderLine(Connection con, int orderId) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.deleteOrderLine");
		int[] result = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderId);
			
			result = ps.executeBatch();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		
		return result;
	}
	
	/**
	 * 배송 정보까지 취소
	 * */
	public int[] deleteOrderDeil(Connection con, int orderId) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.deleteOrderDeil");
		int[] result = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderId);
			
			result = ps.executeBatch();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		
		return result;
	}

	/**
	 * 주문 전체 조회
	 * @param String field(정렬 기준)
	 * @return List<OrderDTO>
	 * */
	@Override
	public List<OrderDTO> selectAll(int pageNum, String field) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("order.selectAll");
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		
		String orderBy = "order_id";
		if(field != null) {
			if (field.equals("user_id")) {
				sql = proFile.getProperty("order.selectAllUserId");
			} else if (field.equals("highprice")){
				sql = proFile.getProperty("order.selectAllHighPrice");
			} else if (field.equals("rowprice")){
				sql = proFile.getProperty("order.selectAllRowPrice");
			}
		}
		
		try {
			// 전체 레코드 수를 반환하는 메소드로 db에 저장된 총 레코드 수를 구함
			int totalCount = this.getTotalCount();
			System.out.println(totalCount);
			// 구한 전체 레코드 수로 전체 페이지 수를 구함
			int totalPage = totalCount % OrderListPageCnt.getPagesize() == 0 ? totalCount / OrderListPageCnt.getPagesize() : (totalCount / OrderListPageCnt.getPagesize()) + 1;
			
			OrderListPageCnt OrderListPageCnt = new OrderListPageCnt();
			OrderListPageCnt.setPageCnt(totalPage); // 구한 전체 페이지 수를 저장함
			OrderListPageCnt.setPageNo(pageNum); // 유저가 클릭한 페이지 번호를 저장
			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, (pageNum - 1) * OrderListPageCnt.pagesize + 1); // 시작점(해당 페이지의 첫 글) 번호
			ps.setInt(2, pageNum * OrderListPageCnt.pagesize); // 끝점(해당 페이지의 마지막 글) 번호

			rs = ps.executeQuery();
			while(rs.next()) {
				orderList.add(new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10), rs.getInt(11),
						rs.getString(12)));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return orderList;
	}
	
	/**
	 * 전체 레코드 수 반환
	 * @return int(전체 레코드 갯수)
	 * */
	private int getTotalCount() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("order.getTotalCount");
		int totalCount = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return totalCount;
	}

	/**
	 * 유저 아이디로 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	@Override
	public List<OrderDTO> selectByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("order.selectByUserId");
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderDTO order = new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10), rs.getInt(11),
						rs.getString(12));
				list.add(order);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}

	/**
	 * 주문 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	@Override
	public OrderDTO selectByOrderId(int orderId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("order.selectByOrderId");
		OrderDTO order = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderId);
			rs = ps.executeQuery();
			while(rs.next()) {
				order = new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10), rs.getInt(11),
						rs.getString(12));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return order;
	}

	/**
	 * 월간 주문 식단 가져오기
	 * @param String goodsId, String userId, String date
	 * @return OrderDeliDTO
	 * */
	@Override
	public List<OrderDeliDTO> selectMlyDeli(String goodsId, String userId, String date) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("order.selectMlyDeli");
		List<OrderDeliDTO> list = new ArrayList<OrderDeliDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsId);
			ps.setString(2, userId);
			ps.setString(3, date);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderDeliDTO od = new OrderDeliDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
				list.add(od);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
}
