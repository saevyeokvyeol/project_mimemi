package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mimemi.mvc.dao.CartDAO;
import mimemi.mvc.dao.CartDAOImpl;
import mimemi.mvc.dto.CartDTO;

public class CartServiceImpl implements CartService {
	private CartDAO cartDao = new CartDAOImpl();
	
	/**
	 * 장바구니 등록
	 * @param CartDTO(String userId, String goodsId, int cartQty, String cartWeekday, String cartPeriod,
			String cartStart)
	 */
	@Override
	public void insert(CartDTO cart) throws SQLException {
		// TODO Auto-generated method stub

	}

	/**
	 * 장바구니 수량 변경
	 * @param: int cartId, int cartQty
	 * */
	@Override
	public void updateCartQty(int cartId, int cartQty) throws SQLException {
		int result = cartDao.updateCartQty(cartId, cartQty);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 장바구니 요일 변경
	 * @param: int cartId, String cartWeekday
	 * */
	@Override
	public void updateCartWeekday(int cartId, String cartWeekday) throws SQLException {
		int result = cartDao.updateCartWeekday(cartId, cartWeekday);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 장바구니 기간 변경
	 * @param: int cartId, String cartPeriod
	 * */
	@Override
	public void updateCartPeriod(int cartId, String cartPeriod) throws SQLException {
		int result = cartDao.updateCartPeriod(cartId, cartPeriod);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 장바구니 첫 배송일 변경
	 * @param: int cartId, String cartStart
	 * */
	@Override
	public void updateCartStart(int cartId, String cartStart) throws SQLException {
		int result = cartDao.updateCartStart(cartId, cartStart);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 장바구니 부분 삭제
	 * @param int[] cartId
	 */
	@Override
	public void deleteSelectedCart(List<Integer> cartId) throws SQLException {
		int result = cartDao.deleteSelectedCart(cartId);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 장바구니 전체 삭제
	 * @param String userId
	 */
	@Override
	public void deleteAllCart(String userId) throws SQLException {
		int result = cartDao.deleteAllCart(userId);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 장바구니 조회
	 * @param userId(유저 아이디가 들어간 모든 장바구니 가져오기)
	 * @return List<CartDTO>
	 */
	@Override
	public List<CartDTO> selectCartByUserId(String userId) throws SQLException {
		List<CartDTO> list = cartDao.selectCartByUserId(userId);
		
		return list;
	}

	/**
	 * 장바구니 조회
	 * @param userId(유저 아이디가 들어간 모든 장바구니 가져오기)
	 * @return List<CartDTO>
	 */
	@Override
	public CartDTO selectCartByCartId(int cartId) throws SQLException {
		CartDTO cart = cartDao.selectCartByCartId(cartId);
		
		return cart;
	}
}
