package mimemi.mvc.dao;

import java.sql.SQLException;

/**
 * 배송은 주문 상세가 아닌 주문과 관계가 매칭되어야 한다.
 * 주문 상세와 관계가 매칭된다면 의미상 "음식 하나(주문상세) 당 하나의 배송"이 이루어지는데,
 * 실제로는 "주문 당 하나의 배송"이 되어야 하므로
 * @author egg
 *
 */
public interface OrderDeliDAO {

	/**
	 * 주문 배송 조회 
	 * @param orderId
	 * @return
	 * @throws SQLException
	 */
	OrderDeli selectByOrderId(int orderId) throws SQLException;
	
	/**
	 * 주문 배송 등록
	 * @param orderDeli
	 * @return
	 * @throws SQLException
	 */
	int insert(OrderDeli orderDeli) throws SQLException;

	/**
	 * 주문 배송 수정
	 * @param orderDeli
	 * @return
	 * @throws SQLException
	 */
	int update(OrderDeli orderDeli) throws SQLException;
	
	/**
	 * 주문 배송 상태 수정
	 * @param orderDeliId
	 * @param orderState
	 * @return
	 * @throws SQLException
	 */
	int updateOrderState(int orderDeliId, OrderState orderState) throws SQLException;

	/**
	 * 주문 배송 삭제
	 * 주문 배송을 취소할 때, 실제로 취소된 주문 배송도 조회가 가능해야 하므로 취소 여부에 대한 컬럼이 추가로 필요함
	 * @param OrderDeliId
	 * @return
	 * @throws SQLException
	 */
	int delete(int OrderDeliId) throws SQLException;

	
}
