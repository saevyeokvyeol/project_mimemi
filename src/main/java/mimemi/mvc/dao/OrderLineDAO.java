package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;

public interface OrderLineDAO {

	/**
	 * 주문 상세 삭제(취소)
	 * @param int orderLineId(오더 라인 아이디를 기준으로 배송 스케줄을 모두 취소 처리함)
	 * @return int(수정한 레코드 수)
	 */
	int delete(int orderLineId) throws SQLException;
	
	/**
	 * 오더 아이디로 주문 상세 조회
	 * @param int orderId(오더 아이디에 해당하는 주문 상세 가져오기)
	 * @return List<OrderLineDTO>
	 */
	List<OrderLineDTO> selectLineByOrderId(int orderId) throws SQLException;

}