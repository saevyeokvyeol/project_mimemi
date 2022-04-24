package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderStateDTO;

public interface OrderDeliDAO {
	
	/**
	 * 배송 일자 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderDeliDate)
	 * @return: int(수정된 스케줄 수)
	 * */
	int updateDeliDate(int orderDeliId, String orderDeliDate) throws SQLException;
	
	/**
	 * 배송 코드 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	int updateStateId(int orderDeliId, String orderStateId) throws SQLException;
	
	/**
	 * 주문 상세 코드로 배송 스케줄 조회
	 * @param: OrderDeliDTO(intoorderLineId)
	 * @return: List<OrderDeliDTO>
	 * */
	List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException;
	
	/**
	 * 주문 상태 코드 가져오기
	 * @return: List<OrderStateDTO>
	 * */
	List<OrderStateDTO> selectOrderState() throws SQLException;
}
