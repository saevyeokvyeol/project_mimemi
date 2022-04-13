package mimemi.mvc.dao;

import mimemi.mvc.dto.CartDTO;

public interface CartDAO {
	
	/**
	 * 二쇰Ц - 二쇰Ц �긽�꽭�� 媛숈씠 �옣諛붽뎄�땲�� �긽�뭹�룄 �떎�� �떎 愿�怨꾧� �씠猷⑥뼱吏꾨떎.
	 * 洹몄뿉 �뵲�씪 "二쇰Ц"-"二쇰Ц �긽�꽭"�쓽 愿�怨꾩� 媛숈씠 "�옣諛붽뎄�땲"-"�옣諛붽뎄�땲 �긽�꽭" 愿�怨꾧� �릺�뼱�빞 �븿.
	 * "�옣諛붽뎄�땲 �긽�꽭" �뀒�씠釉� 異붽� �븘�슂가나다라
	 * @param cartId
	 * @param GoodsId
	 * @return
	 */
	int insert(CartDTO cart);
}