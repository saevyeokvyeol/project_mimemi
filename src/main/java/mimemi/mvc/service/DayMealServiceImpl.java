package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.DayMealDAO;
import mimemi.mvc.dao.DayMealDAOImpl;
import mimemi.mvc.dto.DayMealDTO;
import mimemi.mvc.dto.MealDTO;

public class DayMealServiceImpl implements DayMealService {

	private DayMealDAO dayMealDAO = new DayMealDAOImpl();
	
	@Override
	public void dayMealInsert(DayMealDTO dayMeal) throws SQLException {
		int result = dayMealDAO.dayMealInsert(dayMeal);
		if(result == 0) {
			throw new SQLException("도시락이 등록되지 않았습니다");
		}
	}
	
	public void dayMealUpdate(DayMealDTO dayMeal) throws SQLException {
		int result = dayMealDAO.dayMealUpdate(dayMeal);
		if(result == 0) {
			throw new SQLException("도시락이 수정되지 않았습니다");
		}
	}

	@Override
	public List<DayMealDTO> selectByMonth(String date) throws SQLException {
		List<DayMealDTO> list = dayMealDAO.selectByMonth(date);
		if(list.size() == 0 || list.isEmpty()) {
			throw new SQLException("도시락의 정보가 없어 검색할 수 없습니다.");
		}
		return list;
	}

	@Override
	public List<DayMealDTO> selectByUserOrder(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
