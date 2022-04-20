package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.MealDAO;
import mimemi.mvc.dao.MealDAOImpl;
import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.MealDTO;

public class MealServiceImpl implements MealService {

	private MealDAO mealDAO = new MealDAOImpl();
	
	@Override
	public void mealInsert(MealDTO meal) throws SQLException {
		int result = mealDAO.mealInsert(meal);
		if(result == 0) {
			throw new SQLException("도시락이 등록되지 않았습니다");
		}
	}

	@Override
	public void mealUpdate(MealDTO meal) throws SQLException {
		int result = mealDAO.mealUpdate(meal);
		if(result == 0) {
			throw new SQLException("도시락이 수정되지 않았습니다");
		}
	}

	@Override
	public void mealUpdateForSale(String mealId, String mealSale) throws SQLException {
		int result = mealDAO.mealUpdateForSale(mealId, mealSale);
		if(result == 0) {
			throw new SQLException("도시락이 수정되지 않았습니다");
		}
	}

	@Override
	public List<MealDTO> mealSelectAll() throws SQLException {
		List<MealDTO> list = mealDAO.mealSelectAll();
		if(list.size() == 0 || list.isEmpty()) {
			throw new SQLException("도시락의 정보가 없어 검색할 수 없습니다.");
		}
		return list;
	}

	@Override
	public List<MealDTO> mealSelectForSale() throws SQLException {
		List<MealDTO> list = mealDAO.mealSelectForSale();
		if(list.size() == 0 || list.isEmpty()) {
			throw new SQLException("도시락의 정보가 없어 검색할 수 없습니다.");
		}
		return list;
	}

	@Override
	public List<MealDTO> mealSelectByMealId(String mealId) throws SQLException {
		List<MealDTO> list = mealDAO.mealSelectByMealId(mealId);
		return list;
	}
}
