package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.util.DbUtil;

public class UserDAOImpl implements UserDAO {
	private Properties proFile = new Properties();
	
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public UserDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserDTO loginUser(String userId, String userPwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
				
		String sql = "select * from users where user_id=? and user_pwd=?";
		UserDTO userDTO = null;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userPwd);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				userDTO= new UserDTO(rs.getString(1), rs.getString(2));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userDTO;
	}

	@Override
	public int insertUser(UserDTO user) throws SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		int result=0;
		String sql = proFile.getProperty("user.insertUser"); //insert into users values(?,?,?,?,user_point,sysdate,user_quit,?)
		try {
			con=DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserId());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getUserPwd());
			ps.setString(4, user.getUserPhone());
			ps.setString(5, user.getUserBirth());
			result=ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public String selectUserId(String userName, String userPhone) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String userId =null;
		
		String sql = proFile.getProperty("user.selectUserId");//select user_id from users where user_name=? and user_phone=?
		try {
			con=DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, userPhone);
			rs=ps.executeQuery();
			if(rs.next()) {
				userId = rs.getString(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return userId;
	}

	@Override
	public boolean selectUserPwd(String userId, String userName, String userPhone) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = proFile.getProperty("user.selectUserPwd");//select user_pwd from users where user_id=? and user_name=? and user_phone=?
		try {
			con=DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userName);
			ps.setString(3, userPhone);
			rs=ps.executeQuery();
			if(rs.next()) {
				result = rs.getBoolean(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return result;
	}
	
	@Override
	public UserDTO selectByID(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO user = new UserDTO();
		
		String sql = proFile.getProperty("user.selectById");//select * from users where user_id=?

		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return user;
	}
	
	@Override
	public List<UserDTO> selectByKeyword(String keyword, String field) throws SQLException { //검색기능, 생일검색 기능 따로 만들어야함.
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UserDTO> userList = new ArrayList<UserDTO>();
		String sql = proFile.getProperty("user.selectByKeyword");
		String column = null;
		
		if (field == "이름") {
			column = "user_name";
		}
		if (field == "생일") {
			column = "user_birth";
		}
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, column);
			ps.setString(2, keyword);
			//select * from users where ?=%?%
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userList;
	}

		
	@Override
	public int updateUser(UserDTO user) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result = 0;
		
		String sql = proFile.getProperty("user.updateUser");//update users set user_phone=?
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, user.getUserPhone());
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int updateUserPwd(String userId, String userPwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result = 0;
		
		String sql = proFile.getProperty("user.updateUserPwd");//update users set user_pwd=? where user_id=?
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int deleteUser(String userId, String userPwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result = 0;
		
		String sql = proFile.getProperty("user.deleteUser");//update users set user_quit=? where user_id=?
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public boolean idCheck(String userId) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con= null;
		boolean result = false;
		
		String sql = proFile.getProperty("user.selectById");
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			rs=ps.executeQuery();
			if(rs.next()) {
				result=true;
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
				DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}

	@Override
	public boolean phoneCheck(String userPhone) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con= null;
		boolean result = false;
		String sql = proFile.getProperty("user.selectByPhone");
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userPhone);
			rs=ps.executeQuery();
			if(rs.next()) {
				result=true;
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
				DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}

}
