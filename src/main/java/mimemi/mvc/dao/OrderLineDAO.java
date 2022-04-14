package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;

public interface OrderLineDAO {

	/**
	 *주문상세 조회
	 * @return
	 * @throws SQLException
	 */
	List<OrderLineDTO> selectByOrderId(int orderId) throws SQLException;
	
	/**
	 * 주문상세 추가
	 * @param orderLine
	 * @return
	 */
	int insert(OrderLineDTO orderLine) throws SQLException;
	
	/**
	 * 주문상세 삭제
	 * @param orderLineId
	 * @return
	 * @throws SQLException
	 */
	int delete(int orderLineId) throws SQLException;
	
	/**
	 * 주문상세 수정
	 */
	int updatOrderLine (OrderLineDTO orderLine) throws SQLException;
}
