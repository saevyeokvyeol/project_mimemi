package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import java.util.List;

public interface OrderDAO {
	/**
	 * 주문상세 배송 조회
	 * @param orderLineId
	 * @return
	 * @throws SQLException
	 */
	List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException;
	
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
	 * 배송 주문 상태 변경
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	int updateDeliState(OrderDeliDTO orderDeli) throws SQLException;
	
	 /* 주문전체조회
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectAll() throws SQLException;
	
	/**
	 * 주문 등록
	 * @param order
	 * @return
	 * @throws SQLException
	 */
	int insert(OrderDTO order) throws SQLException;
	
	/**
	 * 주문 취소 (배송 전)
	 * 주문을 취소하더라도 주문 내역을 확인할 필요가 있으므로, 실제 DB에서 데이터를 지우기 보다는 취소된 주문이다를 확인할 수 있는 데이터 컬럼이 필요할 것 같다. 
	 * 이거 DeliState로 처리해야 할까여??
	 * 만들게 되면 만들자 !! 
	 * @param orderId
	 * @return
	 * @throws SQLException
	 */
	int cancel(int orderId) throws SQLException;
}
