package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.OrderDAO;
import mimemi.mvc.dao.OrderDAOImpl;
import mimemi.mvc.dao.OrderDeliDAO;
import mimemi.mvc.dao.OrderDeliDAOImpl;
import mimemi.mvc.dao.OrderLineDAO;
import mimemi.mvc.dao.OrderLineDAOImpl;
//import mimemi.mvc.dao.OrderLineDAOImpl;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;
import mimemi.mvc.dto.OrderStateDTO;

public class OrderServiceImpl implements OrderService {
	private OrderDAO orderDao = new OrderDAOImpl();
	private OrderLineDAO orderLineDao = new OrderLineDAOImpl();
	private OrderDeliDAO orderDeliDao = new OrderDeliDAOImpl();

	/**
	 * 주문 등록
	 * @param OrderDTO(String userId, int addrId, String payMethod, int payPoint, String orderMemo,
	 * 			String takeMethod, String doorPwd, String usercouId)
	 */
	@Override
	public void insertOrder(OrderDTO order, String mode) throws Exception {
		int result = orderDao.insertOrder(order, mode);
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 주문 상세 취소
	 * : 주문 번호를 이용해 해당 주문 상세를 취소함
	 * @param int orderLineId
	 */
	@Override
	public void deleteOrderLine(int orderLineId) throws SQLException {
		int result = orderDao.deleteOrderLine(orderLineId);
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 주문 상세 취소
	 * : 주문 번호를 이용해 해당 주문 건에 연관된 모든 배송 스케줄을 취소 처리함
	 * @param int orderId
	 */
	@Override
	public void deleteOrder(int orderId) throws SQLException {
		int result = orderDao.deleteOrder(orderId);
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 주문 전체 조회
	 * @param String field(정렬 기준)
	 * @return List<OrderDTO>
	 * */
	@Override
	public List<OrderDTO> selectAll(int pageNum, String field) throws SQLException {
		List<OrderDTO> orderList = orderDao.selectAll(pageNum, field);
			
		return orderList;
	}
	
	/**
	 * 유저 아이디로 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	@Override
	public List<OrderDTO> selectByUserId(String userId) throws SQLException {
		List<OrderDTO> orderList = orderDao.selectByUserId(userId);
		
		return orderList;
	}
	
	/**
	 * 유저 아이디로 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	@Override
	public List<OrderDTO> selectCancelByUserId(String userId) throws SQLException {
		List<OrderDTO> orderList = orderDao.selectCancelByUserId(userId);
		
		return orderList;
	}

	/**
	 * 주문 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	@Override
	public OrderDTO selectByOrderId(int orderId) throws SQLException {
		OrderDTO order = orderDao.selectByOrderId(orderId);
		
		return order;
	}

	/**
	 * 오더 아이디로 주문 상세 조회
	 * @param int orderId(오더 아이디에 해당하는 주문 상세 가져오기)
	 * @return List<OrderLineDTO>
	 */
	@Override
	public List<OrderLineDTO> selectLineByOrderId(int orderId) throws SQLException {
		List<OrderLineDTO> orderList = orderLineDao.selectLineByOrderId(orderId);
		
		return orderList;
	}

	/**
	 * 주문 상세 코드로 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderLineId)
	 * @return: List<OrderDeliDTO>
	 * */
	public List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException {
		List<OrderDeliDTO> list = orderDeliDao.selectByOrderLineId(orderLineId);
		
		return list;
	}

	/**
	 * 월간 주문 식단 가져오기
	 * @param String goodsId, String userId, String date
	 * @return OrderDeliDTO
	 * */
	@Override
	public List<OrderDeliDTO> selectMlyDeli(String goodsId, String userId, String date) throws SQLException {
		List<OrderDeliDTO> list = orderDao.selectMlyDeli(goodsId, userId, date);
		
		return list;
	}
	
	/**
	 * 배송 일자 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderDeliDate)
	 * @return: int(수정된 스케줄 수)
	 * */
	@Override
	public void updateDeliDate(int orderDeliId, String orderDeliDate) throws SQLException {
		int result = orderDeliDao.updateDeliDate(orderDeliId, orderDeliDate);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 배송 코드 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	@Override
	public void updateStateId(int orderDeliId, String orderStateId) throws SQLException {
		int result = orderDeliDao.updateStateId(orderDeliId, orderStateId);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 주문 상태 코드 가져오기
	 * @return: List<OrderStateDTO>
	 * */
	@Override
	public List<OrderStateDTO> selectOrderState() throws SQLException{
		List<OrderStateDTO> list = orderDeliDao.selectOrderState();
		 
		return list;
	};
}
