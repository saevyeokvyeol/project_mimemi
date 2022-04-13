package mimemi.mvc.dao;

public interface CartDAO {
	
	/**
	 * 주문 - 주문 상세와 같이 장바구니와 상품도 다대 다 관계가 이루어진다.
	 * 그에 따라 "주문"-"주문 상세"의 관계와 같이 "장바구니"-"장바구니 상세" 관계가 되어야 함.
	 * "장바구니 상세" 테이블 추가 필요
	 * @param cartId
	 * @param GoodsId
	 * @return
	 */
	int insert(Cart cart);
}
