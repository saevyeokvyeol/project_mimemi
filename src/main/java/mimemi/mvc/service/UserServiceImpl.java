package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import javax.security.sasl.AuthenticationException;

import mimemi.mvc.dao.AddrDAO;
import mimemi.mvc.dao.AddrDAOImpl;
import mimemi.mvc.dao.UserDAO;
import mimemi.mvc.dao.UserDAOImpl;
import mimemi.mvc.dto.AddrDTO;
import mimemi.mvc.dto.UserDTO;

public class UserServiceImpl implements UserService {
	private UserDAO userDAO = new UserDAOImpl();
	private AddrDAO addrDAO = new AddrDAOImpl();

	@Override
	public UserDTO loginUser(String userId, String userPwd) throws SQLException, AuthenticationException {
		UserDTO userDTO = userDAO.loginUser(userId, userPwd);
		if(userDTO == null) {
			
			throw new AuthenticationException("아이디와 비밀번호를 확인해주세요");
		}
		return userDTO;
	}

	@Override
	public void insertUser(UserDTO user, AddrDTO addr) throws SQLException {
		int result = userDAO.insertUser(user,addr);
		if(result==0) {throw new SQLException("회원가입에 실패했습니다.");
		
		}
		

	}

	@Override
	public String selectUserId(String userName, String userPhone) throws SQLException {
		String result = userDAO.selectUserId(userName, userPhone);
		if(result==null) {throw new SQLException("해당하는 정보가 없습니다.");}
		return result;
	}

	@Override
	public boolean selectUserPwd(String userId, String userName, String userPhone) throws SQLException {
		boolean result = userDAO.selectUserPwd(userId, userName, userPhone);
		
		if(result == false) {throw new SQLException("해당 정보가 존재하지 않습니다.");

		}else {
			return true;
		}
	}

	@Override
	public int selectPointByUserId(String userId) throws SQLException {
		int result = userDAO.selectPointByUserId(userId);
		if(result<0) {throw new SQLException("해당 아이디에 대한 정보가 없습니다.");		
		}else {
			return result;	
		}		
	}

	@Override
	public List<UserDTO> selectByKeyword(String keyword, String field) throws SQLException {
		List<UserDTO> userlist = userDAO.selectUserByKeyword(keyword, field);
		if(userlist==null) {throw new SQLException("해당정보가 존재하지 않습니다.");
		
		}
		return userlist;
	}

	@Override
	public UserDTO selectByID(String userId) throws SQLException {
		UserDTO userDTO = userDAO.selectByID(userId);
		if(userDTO==null) {throw new SQLException("입력하진 아이디에 대한 정보가 존재하지 않습니다.");}
		return userDTO;
	}

	@Override
	public void updateUser(UserDTO user) throws SQLException {
		

	}

	@Override
	public void updateUserPwd(String userPwd) throws SQLException {
		int result = userDAO.updateUserPwd(userPwd, userPwd);
		if(result != 1) {
			throw new SQLException("비밀번호 변경에 실패했습니다.");
		}

	}

	@Override
	public void deleteUser(String userId, String userPwd) throws SQLException {
		int result = userDAO.deleteUser(userId, userPwd);
		if(result != 1)
			throw new SQLException(userId + "님의 회원탈퇴에 실패했습니다.");
	}

	@Override
	public boolean idCheck(String userId) throws SQLException {
		UserDTO userDTO = userDAO.selectByID(userId);
		if(userDTO != null) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean phoneCheck(String userPhone) throws SQLException {
		UserDTO userDTO = userDAO.selectByID(userPhone);
		if(userDTO != null) {
			return true;
		}else {
		return false;
		}
	}
	@Override
	public boolean validId(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean validPwd(String userPwd) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
}
