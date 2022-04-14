package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.OrderDeliDTO;

public interface CartDAO {
	/**
	 * 장바구니 조회
	 * @param CartId
	 * @return
	 * @throws SQLException
	 */
	List<CartDTO> selectByCartId(String userId) throws SQLException;

	/**
	 * 장바구니 수정
	 * @param: 
	 * @return: 
	 * */
	int updateCart(CartDTO cart) throws SQLException;	
	
	/**
	 * 장바구니 추가하기
	 * @param 
	 * @param cart
	 * @return
	 */
	
	int insert(CartDTO cart) throws SQLException;
	
	/**
	 * 장바구니 삭제하기
	 * @param cartId
	 * @return
	 * @throws SQLException
	 */
	int deleteCart(int cartId) throws SQLException;
}