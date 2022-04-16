package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.GoodsDTO;

public interface CartService {
	/**
	 * 장바구니 등록
	 * @param CartDTO(String userId, String goodsId, int cartQty, String cartWeekday, String cartPeriod,
			String cartStart)
	 */
	void insert(CartDTO cart) throws SQLException;

	/**
	 * 장바구니 수량 변경
	 * @param: int cartId, int cartQty
	 * */
	void updateCartQty(int cartId, int cartQty) throws SQLException;

	/**
	 * 장바구니 요일 변경
	 * @param: int cartId, String cartWeekday
	 * */
	void updateCartWeekday(int cartId, String cartWeekday) throws SQLException;

	/**
	 * 장바구니 기간 변경
	 * @param: int cartId, String cartPeriod
	 * */
	void updateCartPeriod(int cartId, String cartPeriod) throws SQLException;

	/**
	 * 장바구니 첫 배송일 변경
	 * @param: int cartId, String cartStart
	 * */
	void updateCartStart(int cartId, String cartStart) throws SQLException;
	
	/**
	 * 장바구니 부분 삭제
	 * @param int[] cartId
	 */
	void deleteSelectedCart(List<Integer> cartId) throws SQLException;
	
	/**
	 * 장바구니 전체 삭제
	 * @param String userId
	 */
	void deleteAllCart(String userId) throws SQLException;
	
	/**
	 * 장바구니 조회
	 * @param userId(유저 아이디가 들어간 모든 장바구니 가져오기)
	 * @return List<CartDTO>
	 */
	List<CartDTO> selectCartByUserId(String userId) throws SQLException;
	
}
