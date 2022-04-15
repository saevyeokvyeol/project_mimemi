package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.OrderDeliDTO;

public interface CartDAO {
	/**
	 * 장바구니 등록
	 * @param CartDTO(String userId, String goodsId, int cartQty, String cartWeekday, String cartPeriod,
			String cartStart)
	 * @return int(등록한 레코드 수)
	 */
	int insert(CartDTO cart) throws SQLException;

	/**
	 * 장바구니 수량 변경
	 * @param: int cartId, int cartQty
	 * @return: int(수정한 레코드 수)
	 * */
	int updateCartQty(int cartId, int cartQty) throws SQLException;

	/**
	 * 장바구니 수량 변경
	 * @param: int cartId, String cartWeekday
	 * @return: int(수정한 레코드 수)
	 * */
	int updateCartWeekday(int cartId, String cartWeekday) throws SQLException;

	/**
	 * 장바구니 수량 변경
	 * @param: int cartId, String cartPeriod
	 * @return: int(수정한 레코드 수)
	 * */
	int updateCartPeriod(int cartId, String cartPeriod) throws SQLException;
	
	/**
	 * 장바구니 부분 삭제
	 * @param int[] cartId
	 * @return int(삭제한 레코드 수)
	 */
	int deleteSelectedCart(int[] cartId) throws SQLException;
	
	/**
	 * 장바구니 전체 삭제
	 * @param String userId
	 * @return int(삭제한 레코드 수)
	 */
	int deleteAllCart(String userId) throws SQLException;
	
	/**
	 * 장바구니 조회
	 * @param userId(유저 아이디가 들어간 모든 장바구니 가져오기)
	 * @return List<CartDTO>
	 */
	List<CartDTO> selectCartByUserId(String userId) throws SQLException;
}