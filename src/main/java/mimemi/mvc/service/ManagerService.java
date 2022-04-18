package mimemi.mvc.service;

import java.sql.SQLException;

import javax.security.sasl.AuthenticationException;

import mimemi.mvc.dto.ManagerDTO;

public interface ManagerService {
	/**
	 * 로그인 기능
	 * @param ManagerDTO(String managerId, String managerPwd)
	 * @throws AuthenticationException 
	 * */
	ManagerDTO loginManager(String managerId, String managerPwd) throws SQLException, AuthenticationException;
}
