package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderLineDTO;

public interface OrderLineService {
	
	
	/**
	 * 주문상세 조회
	 * @param orderId
	 * @return
	 * @throws SQLException
	 */
	List<OrderLineDTO> selectByOrderId(int orderId) throws SQLException;
	
	/**
	 * 주문상세 추가
	 * @param orderLine
	 * @throws SQLException
	 */
	void insert(OrderLineDTO orderLine) throws SQLException;
	
	/**
	 * 주문상세 삭제
	 * @param orderLineId
	 * @throws SQLException
	 */
	void delete(int orderLineId) throws SQLException;
	
	/**
	 * 주문상세 수정
	 * @param orderLine
	 * @throws SQLException
	 */
	
	void updatOrderLine (OrderLineDTO orderLine) throws SQLException;
	
	

}
