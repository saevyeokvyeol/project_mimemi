package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.MealDTO;

public interface MealDAO {
	/**
	 * 판매 도시락 등록
	 * @param: MealDTO(String mealId, String goodsId, String mealName, int mealWeight, int mealKcal, int mealCarbo,
	 * 			int mealProtein, int mealFat)
	 * @return: int(등록된 데이터 수)
	 * */
	int mealInsert(MealDTO meal) throws SQLException;
	
	/**
	 * 판매 도시락 수정
	 * @param: MealDTO(String mealId, String mealName, int mealWeight, int mealKcal, int mealCarbo,
	 * 			int mealProtein, int mealFat)
	 * @return: int(수정된 데이터 수)
	 * */
	int mealUpdate(MealDTO meal) throws SQLException;
	
	/**
	 * 판매 도시락 판매 여부 수정
	 * : 판매 도시락의 판매 여부 컬럼을 수정
	 * @param: MealDTO(String mealId, boolean mealSale)
	 * @return: int(수정된 데이터 수)
	 * */
	int mealUpdateForSale(String mealId, String mealSale) throws SQLException;
	
	/**
	 * 전체 도시락 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(전체 상품의 모든 데이터를 가지고 옴)
	 * */
	List<MealDTO> mealSelectAll() throws SQLException;
	
	/**
	 * 판매 중인 도시락 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(goodsSale이 true인 상품)
	 * */
	List<MealDTO> mealSelectForSale() throws SQLException;
	
	/**
	 * 도시락 ID로 조회
	 * @return
	 * @throws SQLException
	 */
	List<MealDTO> mealSelectByMealId(String keyword) throws SQLException;
}
