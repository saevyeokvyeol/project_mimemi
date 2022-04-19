package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.DayMealDTO;

public interface DayMealDAO {
	/**
	 * 월간 식단 등록
	 * @param: DayMenuDTO(int dayMenuId, String mealId, String goodsId, String dayMenuDate)
	 * @return: int(등록된 데이터 수)
	 * */
	int insert(DayMealDTO dayMenu) throws SQLException;
	
	/**
	 * 월간 식단 수정
	 * @param: int dayMenuId, String mealId
	 * @return: int(수정된 데이터 수)
	 * */
	int update(int dayMenuId, String mealId) throws SQLException;
	
	/**
	 * 이달의 월간 식단 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(goodsSale이 true인 상품)
	 * */
	List<DayMealDTO> selectForSale(String sort, String date) throws SQLException;
	
	/**
	 * 배송 식단 조회
	 * 1. 파라미터로 아이디를 받은 뒤
	 * 2. 주문, 주문 상세, 주문 상세 배송 관리를 조인해 해당 아이디의 구매 내역&배송 날짜 가져오기
	 * 3. 상품, 판매 도시락, 월간 식단을 조인해 위의 구매 내역 날짜를 기준으로 메뉴를 가져옴
	 * 4. 내역을 DayMenu 리스트로 만들어 리턴함
	 * @param: String userId
	 * @return:List<DayMenuDTO>(아이디 기준으로 만들어진 배송 식단 리스트)
	 * */
	List<DayMealDTO> selectByUserOrder(String userId) throws SQLException;
}
