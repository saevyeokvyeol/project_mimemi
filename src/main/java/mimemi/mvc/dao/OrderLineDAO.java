package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

public interface OrderLineDAO {

	/**
	 * 주문 상세 조회
	 * @return
	 * @throws SQLException
	 */
	List<OrderLine> selectByOrderId(int orderId) throws SQLException;
	
	/**
	 * 주문 상세 추가
	 * @param orderLine
	 * @return
	 */
	int insert(OrderLine orderLine) throws SQLException;
	
	/**
	 * 주문 상세 취소
	 * @param orderLineId
	 * @return
	 * @throws SQLException
	 */
	int delete(int orderLineId) throws SQLException;
}
