package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.OrderDeliDTO;

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
}
