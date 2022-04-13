package mimemi.mvc.service;

import java.sql.SQLException;

import mimemi.mvc.dto.GoodsDTO;

public interface CartService {

	/**
	 * 
	 * @throws SQLException
	 */
	void insert() throws SQLException;
	
	/**
	 * �옣諛붽뎄�땲 異붽�(?)
	 * @param cartId
	 * @param goods
	 * @throws SQLException
	 */
	void insertCartLine(int cartId, GoodsDTO goods) throws SQLException;
}
