package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import java.util.List;

public interface OrderDAO {
	
	/**
	 * 배송 스케줄 생성
	 * @param: OrderDeliDTO(int orderDeliId, int orderLineCode, int orderStateId, String orderDeliDate)
	 * @return: int(등록된 스케줄 수)
	 * */
	int insertDeli(OrderDeliDTO orderDeli) throws SQLException;
	
	/**
	 * 배송 일자 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderDeliDate)
	 * @return: int(수정된 스케줄 수)
	 * */
	int updateDeliDate(OrderDeliDTO orderDeli) throws SQLException;
	
	/**
	 * 배송 주문 상태 변경
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	int updateDeliState(OrderDeliDTO orderDeli) throws SQLException;
	
	 /* �쟾泥� 二쇰Ц 議고쉶
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectAll() throws SQLException;
	
	/**
	 * 二쇰Ц�븯湲�
	 * @param order
	 * @return
	 * @throws SQLException
	 */
	int insert(OrderDTO order) throws SQLException;
	
	/**
	 * orderId�뿉 �빐�떦�븯�뒗 二쇰Ц�쓣 痍⑥냼�븷 �븣, �떎�젣濡� 痍⑥냼�맂 二쇰Ц�룄 議고쉶媛� 媛��뒫�빐�빞 �븯誘�濡� 痍⑥냼 �뿬遺��뿉 ���븳 而щ읆�씠 異붽�濡� �븘�슂�븿
	 * @param orderId
	 * @return
	 * @throws SQLException
	 */
	int cancel(int orderId) throws SQLException;
}
