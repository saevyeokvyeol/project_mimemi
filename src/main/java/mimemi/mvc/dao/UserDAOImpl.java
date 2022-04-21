package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.AddrDTO;
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
		String sql = proFile.getProperty("user.loginUser"); //select * from users where user_id=? and user_pwd=? and user_quit='U'
				
		UserDTO userDTO = null;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userPwd);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				userDTO= new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userDTO;
	}

	@Override
	public int insertUser(UserDTO user, AddrDTO addr) throws SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		
		int result=0;
		String sql = proFile.getProperty("user.insertUser"); //insert into users(user_id, user_name, user_pwd, user_phone, user_regdate, user_birth) values(?,?,?,?,sysdate,?)
		try {
			con=DbUtil.getConnection();
			con.setAutoCommit(false);
			
			//회원정보 입력
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserId());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getUserPwd());
			ps.setString(4, user.getUserPhone());
			ps.setString(5, user.getUserBirth());
			
			result=ps.executeUpdate();
			
			//주소 저장
			if(this.insertAddr(con, addr)==0) {
				throw new SQLException("회원가입에 실패했습니다");
			}
			
			con.commit();
		}finally {
			con.rollback();
			DbUtil.dbClose(ps,con);
		}
		return result;
	}

	
	@Override
	public int insertAddr(Connection con, AddrDTO addr) throws SQLException {
		PreparedStatement ps = null;
		
		int result=0;
		
		String sql = proFile.getProperty("user.insertAddr");
		// insert into addr values(ADDR_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)
		try {
			
			ps=con.prepareStatement(sql);
			ps.setString(1, addr.getUserId());
			ps.setString(2, addr.getAddrName());
			ps.setInt(3, addr.getZipcode());
			ps.setString(4, addr.getAddrAddr());
			ps.setString(5, addr.getAddrDetailAddr());
			ps.setString(6, addr.getAddrRefAddr());
			ps.setString(7, addr.getReceiverName());
			ps.setString(8, addr.getReceiverPhone());
			
			result=ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, null);
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
				result = true;
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
			rs=ps.executeQuery();
			if(rs.next()) {
				user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
						rs.getString(7), rs.getString(8));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return user;
	}
	@Override
	public UserDTO selectByPhone(String userPhone) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO user = new UserDTO();
		String sql = proFile.getProperty("user.selectByPhone");//select * from users where user_phone=?

		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userPhone);
			rs=ps.executeQuery();
			if(rs.next()) {
				user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
						rs.getString(7), rs.getString(8));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return user;
	}
	
	
	@Override
	public int selectPointByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int userPoint = 0;
		
		String sql = proFile.getProperty("user.selectPointByUserId");//select user_point from users where user_id=?

		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			rs=ps.executeQuery();
			if(rs.next()) {
				userPoint= rs.getInt(1);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userPoint;
	}
	
	@Override
	public List<UserDTO> selectUserByKeyword(String keyword, String field) throws SQLException { //이름검색기능
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UserDTO> userList = new ArrayList<UserDTO>();
		String sql = null;
		
		if (field == "이름") {
			sql = proFile.getProperty("user.selectUserByName"); //select * from users where user_name=%?%
		}else if(field == "생일") {
			sql = proFile.getProperty("user.selectUserByBirth"); //select * from users where extract(month from user_birth)='?' 
		}			
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, keyword);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				UserDTO user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
						rs.getString(7), rs.getString(8));
				
				userList.add(user);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return userList;
	}

		
	@Override
	public int updateUser(UserDTO user, AddrDTO addr) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result = 0;
		
		String sql = proFile.getProperty("user.updateUser");//update users set user_phone=? where user_id=?
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, user.getUserPhone());
			ps.setString(2, user.getUserId());
			result = ps.executeUpdate();
			
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int updateAddr(Connection con, AddrDTO addr) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = proFile.getProperty("user.updateAddr"); //update addr set zipcode=?, addr_addr=?, addr_detail_addr=?, addr_ref_addr=?, receiver_phone=? where user_id=?
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, addr.getZipcode());
			ps.setString(2, addr.getAddrAddr());
			ps.setString(3, addr.getAddrDetailAddr());
			ps.setString(4, addr.getAddrRefAddr());
			ps.setString(5, addr.getReceiverPhone());
			ps.setString(6, addr.getUserId());
			
			result=ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, null);
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
//			System.out.println(userPwd);
//			System.out.println(userId);
			ps.setString(1, userPwd);
			ps.setString(2, userId);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int deleteUser(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result = 0;
		
		String sql = proFile.getProperty("user.deleteUser");//update users set user_quit='T' where user_id=?
		
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
