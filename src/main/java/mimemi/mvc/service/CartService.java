package mimemi.mvc.service;

import java.sql.SQLException;

public interface CartService {

	/**
	 * 
	 * @throws SQLException
	 */
	void insert() throws SQLException;
	
	/**
	 * 장바구니 추가(?)
	 * @param cartId
	 * @param goods
	 * @throws SQLException
	 */
	void insertCartLine(int cartId, Goods goods) throws SQLException;
}
