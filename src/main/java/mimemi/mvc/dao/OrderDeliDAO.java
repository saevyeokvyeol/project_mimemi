package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.OrderDeliDTO;

public interface OrderDeliDAO {
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
	 * 주문 상세 코드로 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException;
	
	/**
	 * 개별 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	OrderDeliDTO selectByOrderDeliId(int orderDeliId) throws SQLException;
}
