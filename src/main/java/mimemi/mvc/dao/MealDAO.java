package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.MealDTO;

public interface MealDAO {
	/**
	 * 판매 도시락 등록
	 * @param: MealDTO(String mealId, String goodsId, String mealName, int mealWeight, int mealCarbo,
	 * 			int mealProtein, int mealFat)
	 * @return: int(등록된 데이터 수)
	 * */
	int insert(MealDTO meal) throws SQLException;
	
	/**
	 * 판매 도시락 수정
	 * @param: MealDTO(String mealId, String goodsId, String mealName, int mealWeight, int mealCarbo,
	 * 			int mealProtein, int mealFat)
	 * @return: int(수정된 데이터 수)
	 * */
	int update(MealDTO meal) throws SQLException;
	
	/**
	 * 판매 도시락 삭제
	 * : 실제 삭제하는 것이 아니라 판매 여부 컬럼을 수정해 메인 사이트에서 보이지 않도록 처리함
	 * @param: MealDTO(String mealId, boolean mealSale)
	 * @return: int(수정된 데이터 수)
	 * */
	int delete(MealDTO meal) throws SQLException;
	
	/**
	 * 전체 판매 도시락 이름 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(전체 판매 도시락의 아이디와 이름을 가지고 옴)
	 * */
	List<MealDTO> selectAllName(String sort) throws SQLException;
	
	/**
	 * 전체 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(전체 상품의 모든 데이터를 가지고 옴)
	 * */
	List<MealDTO> selectAll(String sort) throws SQLException;
	
	/**
	 * 판매 중인 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<MealDTO>(goodsSale이 true인 상품)
	 * */
	List<MealDTO> selectForSale(String sort) throws SQLException;
	
	/**
	 * 상품코드로 상품 조회
	 * @param: 조회할 상품 코드
	 * @return: MealDTO(인수로 받은 ID와 상품 아이디가 동일한 상품)
	 * */
	MealDTO selectByMealId(String mealId) throws SQLException;
}
