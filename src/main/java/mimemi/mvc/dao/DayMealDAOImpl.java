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
import mimemi.mvc.dto.DayMealDTO;

public class DayMealDAOImpl implements DayMealDAO {
	private Properties proFile = new Properties();
	
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
	
	
	public int insert(DayMealDTO dayMenu) throws SQLException;
	
	/**
	 * 월간 식단 수정
	 * @param: int dayMenuId, String mealId
	 * @return: int(수정된 데이터 수)
	 * */
	public int update(int dayMenuId, String mealId) throws SQLException;
	
	/**
	 * 이달의 월간 식단 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(goodsSale이 true인 상품)
	 * */
	public List<DayMealDTO> selectForSale(String sort, String date) throws SQLException;
	
	/**
	 * 배송 식단 조회
	 * 1. 파라미터로 아이디를 받은 뒤
	 * 2. 주문, 주문 상세, 주문 상세 배송 관리를 조인해 해당 아이디의 구매 내역&배송 날짜 가져오기
	 * 3. 상품, 판매 도시락, 월간 식단을 조인해 위의 구매 내역 날짜를 기준으로 메뉴를 가져옴
	 * 4. 내역을 DayMenu 리스트로 만들어 리턴함
	 * @param: String userId
	 * @return:List<DayMenuDTO>(아이디 기준으로 만들어진 배송 식단 리스트)
	 * */
	public List<DayMealDTO> selectByUserOrder(String userId) throws SQLException;

}
