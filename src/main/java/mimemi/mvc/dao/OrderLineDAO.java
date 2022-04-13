package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderLineDTO;

public interface OrderLineDAO {

	/**
	 * 二쇰Ц �긽�꽭 議고쉶
	 * @return
	 * @throws SQLException
	 */
	List<OrderLineDTO> selectByOrderId(int orderId) throws SQLException;
	
	/**
	 * 二쇰Ц �긽�꽭 異붽�
	 * @param orderLine
	 * @return
	 */
	int insert(OrderLineDTO orderLine) throws SQLException;
	
	/**
	 * 二쇰Ц �긽�꽭 痍⑥냼
	 * @param orderLineId
	 * @return
	 * @throws SQLException
	 */
	int delete(int orderLineId) throws SQLException;
}
