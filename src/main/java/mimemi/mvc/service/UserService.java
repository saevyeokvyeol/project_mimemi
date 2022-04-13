package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.UserDTO;

public interface UserService {
	/**
	 * 로그인기능
	 * @param UserDTO(String userId, String userPwd)
	 * 
	 * select user_id , pwd, name from users where user_id=? and pwd=?
	 * */
	UserDTO loginCheck(UserDTO userDTO) throws SQLException;
	
	/**
	 * 회원가입기능
	 * @param UserDTO(String userId, String userName, String userPwd, String userPhone, int userPoint, String userRegdate,
		boolean userQuit, String userBirth)
	 * 
	 * : 회원가입 시 입력 받은 데이터를 가져와서 UserDTO에 insert
	 * */
	void insertUser(UserDTO userDTO) throws SQLException;
	
	/**
	 * 아이디찾기
	 * @param userName, userPhone
	 * 
	 * : 아이디찾기 클릭 시 이름과 휴대폰번호를 입력받아 바로 알려준다.
	 * */
	void selectUserId(String userName, String userPhone) throws SQLException;
	
	/**
	 * 비밀번호찾기
	 * @param userId, userName, userPhone
	 * 
	 * : 비밀번호찾기 클릭 시 userId, userName, userPhone을 입력받고
	 * 	 DB와 비교하고 일치하면 비밀번호 변경 메소드 호출
	 * */
	void selectUserPwd(String userId, String userName, String userPhone) throws SQLException;
	
	/**
	 * 생년월일로 User찾기 (쿠폰 지급 시 사용)
	 * @param userBirth
	 * 
	 * :특정 달에 생일인 유저를 조회
	 * */
	List<UserDTO> selectByUserBirth(String userBirth) throws SQLException;
	
	/**
	 * 회원정보 수정
	 * @param UserDTO(String userPhone)
	 * : 휴대폰번호만 수정?
	 * */
	void updateUser(UserDTO userDTO) throws SQLException;
	
	/**
	 * 비밀번호 변경
	 * @param String userPwd
	 * */
	void updateUserPwd(String userPwd) throws SQLException;
	
	/**
	 * 회원 탈퇴
	 * @param String userPwd
	 * : userPwd를 입력받아 DB와 일치하면 1을 리턴하고, DB에 있는 탈퇴여부 바뀜.(DB에서 삭제하는것이 아님)
	 * */
	void deleteUser(String userPwd) throws SQLException;
}
