package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.OrderDAO;
import mimemi.mvc.dao.OrderDAOImpl;
import mimemi.mvc.dto.OrderDTO;

public class OrderServiceImpl implements OrderService {
	private OrderDAO orderDao = new OrderDAOImpl();

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
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 주문 아이디로 특정 주문 조회
	 * @param int orderId(정렬 기준)
	 * @return OrderDTO
	 * */
	@Override
	public OrderDTO selectByOrderId(int orderId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
