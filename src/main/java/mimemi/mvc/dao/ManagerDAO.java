package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.ManagerDTO;

public interface ManagerDAO {
	
	/**
	 * 로그인 기능
	 * @param ManagerDTO(String managerId, String managerPwd)
	 * */
	ManagerDTO loginCheck(ManagerDTO managerDTO) throws SQLException;
	
}
