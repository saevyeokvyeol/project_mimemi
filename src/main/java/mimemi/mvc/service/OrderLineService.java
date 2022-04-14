package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.MealDTO;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;
import mimemi.mvc.dto.MealDTO;

public interface OrderLineService {
	/**
	 * �ֹ� �� ���
	 * @param OrderLineDTO(int orderId, String goodsId, int orderQty, int priceQty, String deliWeekday,
			String deliPeriod, String deliStart)
	 * @return int(����� ���ڵ� ��)
	 */
	int insert(OrderLineDTO orderLine) throws SQLException;

	/**
	 * �ֹ� �� ����(���)
	 * @param int orderLineId(���� ���� ���̵� �������� ��� �������� ��� ��� ó����)
	 * @return int(������ ���ڵ� ��)
	 */
	int delete(int orderLineId) throws SQLException;
	
	/**
	 * ���� ���̵�� �ֹ� �� ��ȸ
	 * @param int orderId(���� ���̵� �ش��ϴ� �ֹ� �� ��������)
	 * @return List<OrderLineDTO>
	 */
	List<OrderLineDTO> selectLineByOrderId(int orderId) throws SQLException;
}