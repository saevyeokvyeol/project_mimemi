package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.ManagerDTO;

public interface ManagerDAO {
	
	/**
	 * 로그인 기능
	 * @param String managerId, String managerPwd
	 * */
	ManagerDTO loginManager(String managerId, String managerPwd) throws SQLException;
	
}
