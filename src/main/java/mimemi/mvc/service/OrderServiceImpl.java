package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import mimemi.mvc.dao.OrderDAO;
import mimemi.mvc.dao.OrderDAOImpl;
import mimemi.mvc.dao.OrderLineDAO;
import mimemi.mvc.dao.OrderLineDAOImpl;
//import mimemi.mvc.dao.OrderLineDAOImpl;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;

public class OrderServiceImpl implements OrderService {
	private OrderDAO orderDao = new OrderDAOImpl();
	private OrderLineDAO orderLineDao = new OrderLineDAOImpl();

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
	 * 주문 취소
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
	 * 주문 상세 등록
	 * @param OrderLineDTO(int orderId, String goodsId, int orderQty, int priceQty, String deliWeekday,
			String deliPeriod, String deliStart)
	 * @return int(등록한 레코드 수)
	 */
	@Override
	public void insert(OrderLineDTO orderLine) throws SQLException {
		// TODO Auto-generated method stub
	}

	/**
	 * 주문 상세 삭제(취소)
	 * @param int orderLineId(오더 라인 아이디를 기준으로 배송 스케줄을 모두 취소 처리함)
	 * @return int(수정한 레코드 수)
	 */
	@Override
	public void delete(int orderLineId) throws SQLException {
		// TODO Auto-generated method stub
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
	 * 배송 스케줄 생성
	 * @param: OrderDeliDTO(int orderDeliId, int orderLineCode, int orderStateId, String orderDeliDate)
	 * @return: int(등록된 스케줄 수)
	 * */
	@Override
	public void insertDeli(OrderDeliDTO orderDeli) throws SQLException {
		// TODO Auto-generated method stub
	}

	/**
	 * 배송 일자 수정
	 * @param: OrderDeliDTO(int orderDeliId, String orderDeliDate)
	 * @return: int(수정된 스케줄 수)
	 * */
	@Override
	public void updateDeliDate(OrderDeliDTO orderDeli) throws SQLException {
		// TODO Auto-generated method stub
	}

	/**
	 * 주문 상세 코드로 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	@Override
	public List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 개별 배송 스케줄 조회
	 * @param: OrderDeliDTO(int orderDeliId, int orderStateId)
	 * @return: int(수정된 스케줄 수)
	 * */
	@Override
	public OrderDeliDTO selectByOrderDeliId(int orderDeliId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
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

}
