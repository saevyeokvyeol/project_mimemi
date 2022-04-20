package mimemi.mvc.dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import mimemi.mvc.dto.DayMealDTO;
import mimemi.mvc.dto.MealDTO;

public class DayMealDAOImpl implements DayMealDAO {
	private Properties proFile = new Properties();
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public DayMealDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 월간 식단 등록 
	 */
	public int dayMealInsert(DayMealDTO dayMeal) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("daymeal.insert");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, dayMeal.getDayMenuId());
			ps.setString(2, dayMeal.getMealId());
			ps.setString(3, dayMeal.getMealId());
			ps.setString(4, dayMeal.getDayMenuDate());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 월간 식단 수정
	 * @param: int dayMenuId, String mealId
	 * @return: int(수정된 데이터 수)
	 * */
//	public int dayMealUpdate(int dayMenuId, String mealId) throws SQLException {
//		Connection con = null;
//		PreparedStatement ps = null;
//		int result = 0;
//		String sql = proFile.getProperty("daymeal.update");
//		try {
//			con = DbUtil.getConnection();
//			ps = con.prepareStatement(sql);
//			ps.setString(1, mealId);
//			ps.setString(2, mealId);
//			ps.setInt(3, dayMenuId);
//			result = ps.executeUpdate();
//		} finally {
//			DbUtil.dbClose(ps, con);
//			
//		}
//		return result;
//	}
	
	/**
	 * 월간 식단 수정
	 * @param: int dayMenuId, String mealId
	 * @return: int(수정된 데이터 수)
	 * */
	public int dayMealUpdate(DayMealDTO dayMeal) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("daymeal.update"); 
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dayMeal.getMealId());
			ps.setString(2, dayMeal.getMealId());
			ps.setString(3, dayMeal.getDayMenuDate());
			ps.setInt(4, dayMeal.getDayMenuId());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 이달의 월간 식단 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(goodsSale이 true인 상품)
	 * */
	public List<DayMealDTO> selectByMonth(String month) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<DayMealDTO> list = new ArrayList<DayMealDTO>();
		String sql = proFile.getProperty("daymeal.selectByMonth");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "2022/" + String.format("%02d" , Integer.parseInt(month)) + "/01");
			rs = ps.executeQuery();
			while (rs.next()) {
				DayMealDTO daymeal = new DayMealDTO(rs.getInt(1), rs.getString(2), rs.getString(3), dateFormat.format(rs.getDate(4)));
				list.add(daymeal);
			}
		} finally {
			DbUtil.dbClose(ps, con);
			
		}
		return list;
	}
	
	/**
	 * 배송 식단 조회
	 * 1. 파라미터로 아이디를 받은 뒤
	 * 2. 주문, 주문 상세, 주문 상세 배송 관리를 조인해 해당 아이디의 구매 내역&배송 날짜 가져오기
	 * 3. 상품, 판매 도시락, 월간 식단을 조인해 위의 구매 내역 날짜를 기준으로 메뉴를 가져옴
	 * 4. 내역을 DayMenu 리스트로 만들어 리턴함
	 * @param: String userId
	 * @return:List<DayMenuDTO>(아이디 기준으로 만들어진 배송 식단 리스트)
	 * */
	public List<DayMealDTO> selectByUserOrder(String userId) throws SQLException {
		return null;
	}
}
