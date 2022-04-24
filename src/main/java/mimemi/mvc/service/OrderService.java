package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;
import mimemi.mvc.dto.OrderStateDTO;

public interface OrderService {
	/**
	 * 주문 등록
	 * @param OrderDTO(String userId, int addrId, String payMethod, int payPoint, String orderMemo,
	 * 			String takeMethod, String doorPwd, String usercouId)
	 */
	void insertOrder(OrderDTO order, String mode) throws Exception;
	
	/**
	 * 주문 취소
	 * : 주문 번호를 이용해 해당 주문 건에 연관된 모든 배송 스케줄을 취소 처리함
	 * @param int orderId
	 */
	void deleteOrder(int orderId) throws SQLException;
	
	/**
	 * 주문 전체 조회
	 * @param String field(정렬 기준)
	 * @return List<OrderDTO>
	 * */
	List<OrderDTO> selectAll(int pageNum, String field) throws SQLException;
	
	/**
	 * 유저 아이디로 주문 조회
	 * @param String userId(정렬 기준)
	 * @return OrderDTO
	 * */
	List<OrderDTO> selectByUserId(String userId) throws SQLException;
	
	/**
	 * 주문 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	OrderDTO selectByOrderId(int orderId) throws SQLException;
	
	/**
	 * 오더 아이디로 주문 상세 조회
	 * @param int orderId(오더 아이디에 해당하는 주문 상세 가져오기)
	 * @return List<OrderLineDTO>
	 */
	List<OrderLineDTO> selectLineByOrderId(int orderId) throws SQLException;
	
	/**
	 * 주문 상세 코드로 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderLineId)
	 * @return: List<OrderDeliDTO>
	 * */
	List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException;

	/**
	 * 월간 주문 식단 가져오기
	 * @param String goodsId, String userId, String date
	 * @return OrderDeliDTO
	 * */
	List<OrderDeliDTO> selectMlyDeli(String goodsId, String userId, String date) throws SQLException;

	/**
	 * 유저 아이디로 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	List<OrderDTO> selectCancelByUserId(String userId) throws SQLException;

	/**
	 * 주문 상세 취소
	 * : 주문 번호를 이용해 해당 주문 상세를 취소함
	 * @param int orderLineId
	 */
	void deleteOrderLine(int orderLineId) throws SQLException;
	
	/**
	 * 배송 일자 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderDeliDate)
	 * @return: int(수정된 스케줄 수)
	 * */
	void updateDeliDate(int orderDeliId, String orderDeliDate) throws SQLException;
	
	/**
	 * 배송 코드 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	void updateStateId(int orderDeliId, String orderStateId) throws SQLException;

	/**
	 * 주문 상태 코드 가져오기
	 * @return: List<OrderStateDTO>
	 * */
	List<OrderStateDTO> selectOrderState() throws SQLException;
}
