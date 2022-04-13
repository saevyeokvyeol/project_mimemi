package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderStateDTO;

/**
 * 諛곗넚�� 二쇰Ц �긽�꽭媛� �븘�땶 二쇰Ц怨� 愿�怨꾧� 留ㅼ묶�릺�뼱�빞 �븳�떎.
 * 二쇰Ц �긽�꽭�� 愿�怨꾧� 留ㅼ묶�맂�떎硫� �쓽誘몄긽 "�쓬�떇 �븯�굹(二쇰Ц�긽�꽭) �떦 �븯�굹�쓽 諛곗넚"�씠 �씠猷⑥뼱吏��뒗�뜲,
 * �떎�젣濡쒕뒗 "二쇰Ц �떦 �븯�굹�쓽 諛곗넚"�씠 �릺�뼱�빞 �븯誘�濡�
 * @author egg
 *
 */
public interface OrderDeliDAO {

	/**
	 * 二쇰Ц 諛곗넚 議고쉶 
	 * @param orderId
	 * @return
	 * @throws SQLException
	 */
	OrderDeliDTO selectByOrderId(int orderId) throws SQLException;
	
	/**
	 * 二쇰Ц 諛곗넚 �벑濡�
	 * @param orderDeli
	 * @return
	 * @throws SQLException
	 */
	int insert(OrderDeliDTO orderDeli) throws SQLException;

	/**
	 * 二쇰Ц 諛곗넚 �닔�젙
	 * @param orderDeli
	 * @return
	 * @throws SQLException
	 */
	int update(OrderDeliDTO orderDeli) throws SQLException;
	
	/**
	 * 二쇰Ц 諛곗넚 �긽�깭 �닔�젙
	 * @param orderDeliId
	 * @param orderState
	 * @return
	 * @throws SQLException
	 */
	int updateOrderState(int orderDeliId, OrderStateDTO orderState) throws SQLException;

	/**
	 * 二쇰Ц 諛곗넚 �궘�젣
	 * 二쇰Ц 諛곗넚�쓣 痍⑥냼�븷 �븣, �떎�젣濡� 痍⑥냼�맂 二쇰Ц 諛곗넚�룄 議고쉶媛� 媛��뒫�빐�빞 �븯誘�濡� 痍⑥냼 �뿬遺��뿉 ���븳 而щ읆�씠 異붽�濡� �븘�슂�븿
	 * @param OrderDeliId
	 * @return
	 * @throws SQLException
	 */
	int delete(int OrderDeliId) throws SQLException;

	
}
