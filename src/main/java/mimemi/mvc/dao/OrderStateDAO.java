package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderStateDTO;

public interface OrderStateDAO {
	
	List<OrderStateDTO> selectAll() throws SQLException;
}
