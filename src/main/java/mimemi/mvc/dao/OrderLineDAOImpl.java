package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.OrderLineDTO;
import mimemi.mvc.util.DbUtil;

public class OrderLineDAOImpl implements OrderLineDAO {
	private Properties proFile = new Properties();
	
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public OrderLineDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int delete(int orderLineId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = proFile.getProperty("orderLine.deleteOrderLine");
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderLineId);
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<OrderLineDTO> selectLineByOrderId(int orderId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("orderLine.selectLineByOrderId");
		List<OrderLineDTO> orderLineList = new ArrayList<OrderLineDTO>();
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderId);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderLineDTO ol = new OrderLineDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				ol.setGoods(new GoodsDTO());
				ol.getGoods().setGoodsName(rs.getString(10));
				orderLineList.add(ol);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return orderLineList;
	}

}
