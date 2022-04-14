package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;

import java.util.List;

public interface OrderDAO {
	/**
	 * 주문 등록
	 * 
	 * 0. OrderDTO 안의 OrderLineDTO를 통해 상품의 총 구매 금액 구하기
	 * 1. 새 주소로 구매한 경우 addr insert
	 * 2. 주문 테이블 insert
	 * 3. 적립금을 사용한 경우 회원 테이블에서 적립금 차감(update)
	 * 4. 회원 테이블에 적립금 1% 적립(update)
	 * 5. 주문 상세 insert
	 * 6. 쿠폰 사용한 경우 쿠폰 사용 여부 변경(update)
	 * 
	 * 위의 모든 걸 
	 * 
	 * @param OrderDTO(String userId, int addrId, String payMethod, int payPoint, String orderMemo,
	 * 			String takeMethod, String doorPwd, String usercouId)
	 * @return int(등록된 데이터 수)
	 */
	int insertOrder(OrderDTO order) throws SQLException;
	
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
	List<OrderDTO> selectAll(String field) throws SQLException;
	
	/**
	 * 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	OrderDTO selectById(int orderId) throws SQLException;

	/**
	 * 주문 상세 등록
	 * @param OrderLineDTO(int orderId, String goodsId, int orderQty, int priceQty, String deliWeekday,
			String deliPeriod, String deliStart)
	 * @return int(등록한 레코드 수)
	 */
	int insert(OrderLineDTO orderLine) throws SQLException;

	/**
	 * 주문 상세 삭제(취소)
	 * @param int orderLineId(오더 라인 아이디를 기준으로 배송 스케줄을 모두 취소 처리함)
	 * @return int(수정한 레코드 수)
	 */
	int delete(int orderLineId) throws SQLException;
	
	/**
	 * 오더 아이디로 주문 상세 조회
	 * @param int orderId(오더 아이디에 해당하는 주문 상세 가져오기)
	 * @return List<OrderLineDTO>
	 */
	List<OrderLineDTO> selectLineByOrderId(int orderId) throws SQLException;

	/**
	 * 배송 스케줄 생성
	 * @param: OrderDeliDTO(int orderDeliId, int orderLineCode, int orderStateId, String orderDeliDate)
	 * @return: int(등록된 스케줄 수)
	 * */
	int insertDeli(OrderDeliDTO orderDeli) throws SQLException;
	
	/**
	 * 배송 일자 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderDeliDate)
	 * @return: int(수정된 스케줄 수)
	 * */
	int updateDeliDate(OrderDeliDTO orderDeli) throws SQLException;
	
	/**
	 * 주문 상세 코드로 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException;
	
	/**
	 * 개별 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	OrderDeliDTO selectByOrderDeliId(int orderDeliId) throws SQLException;
}
