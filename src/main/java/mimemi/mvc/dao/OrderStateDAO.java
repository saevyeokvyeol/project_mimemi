package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

public interface OrderStateDAO {
	
	List<OrderState> selectAll() throws SQLException;
}
