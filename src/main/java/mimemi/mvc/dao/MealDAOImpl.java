package mimemi.mvc.dao;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.List;
import mimemi.mvc.util.DbUtil;
import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.MealDTO;

public class MealDAOImpl implements MealDAO {
	
	private Properties proFile = new Properties();
	
	public MealDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * 판매 도시락 등록
	 * */
	public int mealInsert(MealDTO meal) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("meal.insert");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, meal.getMealId());
			ps.setString(2, meal.getGoodsId());
			ps.setString(3, meal.getMealName());
			ps.setInt(4, meal.getMealWeight());
			ps.setInt(5, meal.getMealKcal());
			ps.setInt(6, meal.getMealCarbo());
			ps.setInt(7, meal.getMealProtein());
			ps.setInt(8, meal.getMealFat());
			ps.setString(9, meal.getMealImg());
			ps.setString(10, meal.getMealSale());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 판매 도시락 수정
	 * */
	public int mealUpdate(MealDTO meal) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("meal.update");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, meal.getMealName());
			ps.setInt(2, meal.getMealWeight());
			ps.setInt(3, meal.getMealKcal());
			ps.setInt(4, meal.getMealCarbo());
			ps.setInt(5, meal.getMealProtein());
			ps.setInt(6, meal.getMealFat());
			ps.setString(7, meal.getMealImg());
			ps.setString(8, meal.getMealSale());
			ps.setString(9, meal.getMealId());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
			
		}
		return result;
	}

	
	/**
	 * 판매 도시락 판매 여부 수정
	 * */
	public int mealUpdateForSale(String mealId, String mealSale) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("meal.updateForSale");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mealSale);
			ps.setString(2, mealId);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
			
		}
		return result;
	}
	
	/**
	 * 전체 도시락 조회
	 * */
	public List<MealDTO> mealSelectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MealDTO> list = new ArrayList<MealDTO>();
		String sql = proFile.getProperty("meal.selectAll");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MealDTO meal = new MealDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10));
				list.add(meal);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
			
		}
		return list;
	}
	
	/**
	 * 판매 중인 도시락 조회
	 * */
	public List<MealDTO> mealSelectForSale() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MealDTO> list = new ArrayList<MealDTO>();
		String sql = proFile.getProperty("meal.selectForSale");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MealDTO meal = new MealDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10));
				list.add(meal);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
			
		}
		return list;
	}


	@Override
	public List<MealDTO> mealSelectByMealId(String keyword) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MealDTO> list = new ArrayList<MealDTO>();
		String sql = proFile.getProperty("meal.selectByMealId");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + keyword + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				MealDTO meal = new MealDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10));
				list.add(meal);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
}
