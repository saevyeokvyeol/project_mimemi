package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;

import java.util.List;

public interface OrderDAO {
	/**
	 * 주문 등록
	 * 
	 * 0. OrderDTO 안의 OrderLineDTO를 통해 상품의 총 구매 금액 구하기
	 * 1. 새 주소로 구매한 경우 addr insert
	 * 2. 주문 테이블 insert
	 * 3. 적립금을 사용한 경우 회원 테이블에서 적립금 차감(update)
	 * 4. 회원 테이블에 적립금 1% 적립(update)
	 * 5. 주문 상세 insert
	 * 6. 쿠폰 사용한 경우 쿠폰 사용 여부 변경(update)
	 * 
	 * 위의 모든 걸 
	 * 
	 * @param OrderDTO(String userId, int addrId, String payMethod, int payPoint, String orderMemo,
	 * 			String takeMethod, String doorPwd, String usercouId)
	 * @return int(등록된 데이터 수)
	 */
	int insertOrder(OrderDTO order) throws SQLException;
	
	/**
	 * 주문 취소
	 * : 주문 번호를 이용해 해당 주문 건에 연관된 모든 배송 스케줄을 취소 처리함
	 * @param int orderId
	 * @return int(수정한 레코드 수)
	 */
	int deleteOrder(int orderId) throws SQLException;
	
	/**
	 * 주문 전체 조회
	 * @param String field(정렬 기준)
	 * @return List<OrderDTO>
	 * */
	List<OrderDTO> selectAll(String field) throws SQLException;
	
	/**
	 * 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	OrderDTO selectById(int orderId) throws SQLException;
}
