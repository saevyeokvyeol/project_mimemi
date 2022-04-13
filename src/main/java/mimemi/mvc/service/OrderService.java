package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.MealDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.MealDTO;

public interface OrderService {
	/**
	 * 배송 스케줄 생성
	 * @param: OrderDeliDTO(int orderDeliId, int orderLineCode, int orderStateId, String orderDeliDate)
	 * */
	void insertDeli(OrderDeliDTO orderDeli) throws SQLException;
	
	/**
	 * 배송 일자 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderDeliDate)
	 * */
	void updateDeliDate(OrderDeliDTO orderDeli) throws SQLException;
	
	/**
	 * 배송 주문 상태 변경
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * */
	void updateDeliState(OrderDeliDTO orderDeli) throws SQLException;
}
