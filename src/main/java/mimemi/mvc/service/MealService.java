package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.MealDTO;
import mimemi.mvc.dto.MealDTO;

public interface MealService {
	/**
	 * 판매 도시락 등록
	 * @param: MealDTO(String mealId, String goodsId, String mealName, int mealWeight, int mealKcal,
	 * 			int mealCarbo, int mealProtein, int mealFat)
	 * */
	void insert(MealDTO meal) throws SQLException;
	
	/**
	 * 판매 도시락 수정
	 * @param: MealDTO(String mealId, String mealName, int mealWeight, int mealKcal, int mealCarbo,
	 * 			int mealProtein, int mealFat)
	 * */
	void update(MealDTO meal) throws SQLException;
	
	/**
	 * 판매 도시락 판매 여부 수정
	 * : 판매 도시락의 판매 여부 컬럼을 수정
	 * @param: MealDTO(String mealId, boolean mealSale)
	 * */
	void updateForSale(MealDTO meal) throws SQLException;
	
	/**
	 * 전체 도시락 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(전체 상품의 모든 데이터를 가지고 옴)
	 * */
	List<MealDTO> selectAll(String sort) throws SQLException;
	
	/**
	 * 판매 중인 도시락 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(goodsSale이 true인 상품)
	 * */
	List<MealDTO> selectForSale(String sort) throws SQLException;
	
	/**
	 * 도시락 코드로 도시락 조회
	 * @param: 조회할 도시락 코드
	 * @return: MealDTO(인수로 받은 ID와 도시락 아이디가 동일한 상품)
	 * */
	MealDTO selectByMealId(String mealId) throws SQLException;
}
