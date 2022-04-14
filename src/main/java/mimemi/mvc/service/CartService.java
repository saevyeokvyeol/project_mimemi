package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.GoodsDTO;

public interface CartService {

	/**
	 * 장바구니 조회
	 * @param cartId
	 * @return
	 * @throws SQLException
	 */
	List<CartDTO> selectByCartId(int cartId) throws SQLException;
	
	/**
	 * 장바구니 추가
	 * @param cartId
	 * @param goods
	 * @throws SQLException
	 */
	void insertCart(int cartId, GoodsDTO goods) throws SQLException;
	
	
	/**
	 * 장바구니 수정
	 * @param cart
	 * @throws SQLException
	 */
	void updateCart(CartDTO cart) throws SQLException;
	
	/**
	 * 장바구니 삭제하기
	 * @param cartId
	 * @return
	 * @throws SQLException
	 */
	int deleteCart(int cartId) throws SQLException;
	
}
