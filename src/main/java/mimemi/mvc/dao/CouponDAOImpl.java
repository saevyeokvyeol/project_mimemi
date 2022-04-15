package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.LiveCouponDTO;
import mimemi.mvc.dto.RgCouponDTO;
import mimemi.mvc.dto.UserCouponDTO;
import mimemi.mvc.util.DbUtil;

public class CouponDAOImpl implements CouponDAO {
	private Properties proFile = new Properties();
	
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public CouponDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insertLiveCp(LiveCouponDTO liveCoupon) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("coupon.insertLiveCp"); 
		//coupon.insertLiveCp=insert into LIVECOUPON values(?,?,?,sysdate,?)
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, liveCoupon.getLivecouId());
			ps.setString(2, liveCoupon.getLivecouName());
			ps.setInt(3, liveCoupon.getLivecouPrice());
			ps.setInt(4, liveCoupon.getLivecouUseperiod());
			
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	@Override
	public int updateLiveCp(LiveCouponDTO liveCoupon) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertRgCp(RgCouponDTO rgCoupon) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRgCp(RgCouponDTO rgCoupon) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<LiveCouponDTO> selectAllLiveCp() throws SQLException {
		Connection con =null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		
		List<LiveCouponDTO> liveCouponList = new ArrayList<LiveCouponDTO>();
		
		//coupon.selectAllLiveCp=select * from LIVECOUPON order by LIVECOU_ID  desc
		String sql = proFile.getProperty("coupon.selectAllLiveCp");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				LiveCouponDTO liveCoupon = new LiveCouponDTO(rs.getString(1),rs.getString(2),rs.getInt(3),
										rs.getString(4),rs.getInt(5));
				
				liveCouponList.add(liveCoupon);
			}
			
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
	
		return liveCouponList;
	
	}
	

	@Override
	public List<RgCouponDTO> selectAllRgCp() throws SQLException {
		Connection con =null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		
		List<RgCouponDTO> rgCouponList = new ArrayList<RgCouponDTO>();
		
		//coupon.selectAllRgCp=select * from RGCOUPON order by RGCOU_ID desc
		String sql = proFile.getProperty("coupon.selectAllRgCp");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				RgCouponDTO rgCoupon = new RgCouponDTO(rs.getString(1),rs.getString(2),rs.getInt(3),
										rs.getString(4),rs.getString(5));
				
				rgCouponList.add(rgCoupon);
			}
			
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
	
		return rgCouponList;
	}

	@Override
	public int insertUserCp(UserCouponDTO userCoupon, String couponType) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCpState(int usercouId, String state) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserCouponDTO> selectAllUserCp(String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserCouponDTO> selectCpByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("coupon.selectCpByUserId");
		// coupon.selectCpByUserId=select * from USERCOUPON where USER_ID = ? order by USERCOU_ID  desc
		//SELECT * FROM USERCOUPON where user_id='happy01' and livecou_id IS NOT NULL;
		//SELECT * FROM USERCOUPON where user_id='happy01' and rgcou_id IS NOT NULL;
		
		List<UserCouponDTO> userCouponlist = new ArrayList<UserCouponDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserCouponDTO  userCoupon = new UserCouponDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				userCouponlist.add(userCoupon);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userCouponlist;
	}
	

}
