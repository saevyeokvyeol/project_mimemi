package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.UserDTO;

public interface UserDAO {
	
	/**
	 * 로그인기능
	 * @param UserDTO(String userId, String userPwd)
	 * */
	UserDTO loginUser(UserDTO user) throws SQLException;
	
	/**
	 * 회원가입기능
	 * @param UserDTO(String userId, String userName, String userPwd, String userPhone, String userBirth)
	 * 
	 * : 회원가입 시 입력 받은 데이터를 가져와서 UserDTO에 insert
	 * */
	int insertUser(UserDTO user) throws SQLException;
	
	/**
	 * 아이디찾기
	 * @param userName, userPhone
	 * @return  userId
	 * 
	 * : 아이디찾기 클릭 시 이름과 휴대폰번호를 입력받아 바로 알려준다.
	 * */
	String selectUserId(String userName, String userPhone) throws SQLException;
		
	/**
	 * 비밀번호찾기
	 * @param userId, userName, userPhone
	 * @return void
	 * 
	 * : 비밀번호찾기 클릭 시 userId, userName, userPhone을 입력받고
	 * 	 DB와 비교하고 일치하면 비밀번호 변경 메소드 호출
	 * 	 ture면 비밀번호 변경 페이지로 이동
	 * */
	boolean selectUserPwd(String userId, String userName, String userPhone) throws SQLException;
	
	/**
	 * User 검색하기
	 * @param String keyword
	 * field : 이름/생일 등등
	 * 쿼리문쓰고 if 여러개~
	 * */
	List<UserDTO> selectByKeyword(String keyword, String field) throws SQLException;
	
	/**
	 * Id로 user검색하기(id가 완전히 같아야만 검색됨)
	 * */
	UserDTO selectByID(String userId) throws SQLException;
	
	/**
	 * 회원정보 수정
	 * : 주소, 번호 
	 * */
	int updateUser(UserDTO user) throws SQLException;
	
	/**
	 * 비밀번호 변경
	 * @param userId, userPwd
	 * */
	int updateUserPwd(String userId, String userPwd) throws SQLException;
	
	/**
	 * 회원 탈퇴
	 * : userPwd를 입력받아 DB와 일치하면 1을 리턴하고, DB에 있는 탈퇴여부 바뀜.
	 * */
	int deleteUser(String userId, String userPwd) throws SQLException;
	
	/**
	
	 * 아이디 중복 체크
	 
	boolean idCheck(String userId) throws SQLException;
	
	/**
	 * 휴대폰 번호 중복 체크
	  
	boolean phoneCheck(String userPhone) throws SQLException;
	*/
}
