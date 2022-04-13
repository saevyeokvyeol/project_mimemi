package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

public interface OrderDAO {
	
	/**
	 * 전체 주문 조회
	 * @return
	 * @throws SQLException
	 */
	List<Order> selectAll() throws SQLException;
	
	/**
	 * 주문하기
	 * @param order
	 * @return
	 * @throws SQLException
	 */
	int insert(Order order) throws SQLException;
	
	/**
	 * orderId에 해당하는 주문을 취소할 때, 실제로 취소된 주문도 조회가 가능해야 하므로 취소 여부에 대한 컬럼이 추가로 필요함
	 * @param orderId
	 * @return
	 * @throws SQLException
	 */
	int cancel(int orderId) throws SQLException;
}
