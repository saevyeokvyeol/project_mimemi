package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.AddrDTO;
import mimemi.mvc.dto.OrderDTO;
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
	 * 
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
	 */
	@Override
	public int insertOrder(OrderDTO order) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.insertOrder");
		// insert into orders values(ORDERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		int result = 0;
		return result;
	}

	/**
	 * 2. 새 주소로 구매한 경우 addr insert
	 * @param AddrDTO(String userId, String addrName, int zipcode, String addrAddr, String addrDetailAddr,
				String receiverName, String receiverPhone)
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
		
		String sql = proFile.getProperty("order.insertOrder");
		// insert into orders values(ORDERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		int result = 0;
		return 0;
	}

	/**
	 * 4. 회원 테이블에 적립금 1% 적립(update)
	 * @param String userId, int addedPoint
	 * @return int(수정된 데이터 수)
	 * */
	@Override
	public int increamentUserPoint(Connection con, String userId, int addedPoint) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.insertOrder");
		// insert into orders values(ORDERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		int result = 0;
		return 0;
	}

	/**
	 * 5. 주문 상세 insert
	 * @param OrderLineDTO(int orderId, String goodsId, int orderQty, int priceQty, String deliWeekday,
	 *			String deliPeriod, String deliStart)
	 * @return int(등록된 데이터 수)
	 * */
	@Override
	public int insertOrderLine(Connection con, OrderLineDTO orderLine) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("order.insertOrder");
		// insert into orders values(ORDERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		int result = 0;
		return 0;
	}

	/**
	 * 6. 쿠폰 사용한 경우 쿠폰 사용 여부 변경(update)
	 * @param OrderDTO(String userId, int addrId, String payMethod, int payPoint, String orderMemo,
	 * 			String takeMethod, String doorPwd, String usercouId)
	 * @return int(수정된 데이터 수)
	 * */
	@Override
	public int updateUserCoupon(Connection con, int userCouId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 7. 장바구니에 담겨있었을 경우 해당 장바구니 삭제
	 * @param int userId, String goodsId
	 * @return int(삭제한 레코드 수)
	 * */
	@Override
	public int deleteSelectedCart(Connection con, int userId, String goodsId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 주문 취소
	 * : 주문 번호를 이용해 해당 주문 건에 연관된 모든 배송 스케줄을 취소 처리함
	 * @param int orderId
	 * @return int(수정한 레코드 수)
	 */
	@Override
	public int deleteOrder(int orderId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
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
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10), rs.getInt(11)));
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
	 * 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	@Override
	public OrderDTO selectById(int orderId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
