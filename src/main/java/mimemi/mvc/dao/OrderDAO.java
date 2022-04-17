package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import mimemi.mvc.dto.AddrDTO;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderLineDTO;

public interface OrderDAO {
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
	int insertOrder(OrderDTO order, String mode) throws SQLException, ParseException;
	
	/**
	 * 2. 새 주소로 구매한 경우 addr insert
	 * @param Connection con, AddrDTO addr
	 * @return int(등록된 데이터 수)
	 * */
	int insertAddr(Connection con, AddrDTO addr) throws SQLException;
	
	/**
	 * 3. 적립금을 사용한 경우 회원 테이블에서 적립금 차감(update)
	 * @param String userId, int usedPoint
	 * @return int(수정된 데이터 수)
	 * */
	int decreamentUserPoint(Connection con, String userId, int usedPoint) throws SQLException;
	
	/**
	 * 4. 회원 테이블에 적립금 1% 적립(update)
	 * @param String userId, int addedPoint
	 * @return int(수정된 데이터 수)
	 * */
	int increamentUserPoint(Connection con, String userId, int addedPoint) throws SQLException;
	
	/**
	 * 5. 주문 상세 insert
	 * @param Connection con, List<OrderLineDTO> OrderLineDTO
	 * @return int(등록된 데이터 수)
	 * */
	int[] insertOrderLine(Connection con, List<OrderLineDTO> OrderLineDTO) throws SQLException, ParseException;
	
	/**
	 * 6. 쿠폰 사용한 경우 쿠폰 사용 여부 변경(update)
	 * @param Connection con, int userCouId
	 * @return int(수정된 데이터 수)
	 * */
	int updateUserCoupon(Connection con, int userCouId) throws SQLException;
	
	/**
	 * 7. 장바구니에 담겨있었을 경우 해당 장바구니 삭제
	 * @param String userId, String goodsId
	 * @return int(삭제한 레코드 수)
	 * */
	int deleteSelectedCart(Connection con, String userId, String goodsId) throws SQLException;
	
	/**
	 * 주문 취소
	 * : 주문 번호를 이용해 해당 주문 건에 연관된 모든 배송 스케줄을 취소 처리함
	 * @param int orderId
	 * @return int(수정한 레코드 수)
	 */
	int deleteOrder(int orderId) throws SQLException;
	
	/**
	 * 주문 전체 조회
	 * @param String field(정렬 기준)
	 * @return List<OrderDTO>
	 * */
	List<OrderDTO> selectAll(int pageNum, String field) throws SQLException;
	
	/**
	 * 유저 아이디로 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	List<OrderDTO> selectByUserId(String userId) throws SQLException;
	
	/**
	 * 주문 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	OrderDTO selectByOrderId(int orderId) throws SQLException;
}
