package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;
import mimemi.mvc.dto.OrderStateDTO;
import mimemi.mvc.util.DbUtil;

public class OrderDeliDAOImpl implements OrderDeliDAO {
	private OrderLineDAO orderLineDao = new OrderLineDAOImpl();
	private Properties proFile = new Properties();
	
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public OrderDeliDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int updateDeliDate(int orderDeliId, String orderDeliDate) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result = 0;
		String sql = proFile.getProperty("orderDeli.updateDeliDate");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, orderDeliDate);
			ps.setInt(2, orderDeliId);
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int updateStateId(int orderDeliId, String orderStateId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result = 0;
		String sql = proFile.getProperty("orderDeli.updateStateId");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, orderStateId);
			ps.setInt(2, orderDeliId);
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<OrderDeliDTO> selectByOrderLineId(int orderLineId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderDeliDTO> list = new ArrayList<OrderDeliDTO>();
		String sql = proFile.getProperty("orderDeli.selectLineByOrderId");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderLineId);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderDeliDTO od = new OrderDeliDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
				od.setOrderLine(new OrderLineDTO());
				od.getOrderLine().setOrderQty(rs.getInt(5));
				od.getOrderLine().setGoods(new GoodsDTO());
				od.getOrderLine().getGoods().setGoodsName(rs.getString(6));
				list.add(od);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	/**
	 * 주문 상태 코드 가져오기
	 * @return: List<OrderStateDTO>
	 * */
	@Override
	public List<OrderStateDTO> selectOrderState() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderStateDTO> list = new ArrayList<OrderStateDTO>();
		String sql = proFile.getProperty("orderDeli.selectOrderState");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderStateDTO os = new OrderStateDTO(rs.getString(1), rs.getString(2));
				list.add(os);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

}
