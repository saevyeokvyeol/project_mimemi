package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("coupon.updateLiveCp"); 
		//coupon.updateLiveCp=update LIVECOUPON set LIVECOU_NAME=?, LIVECOU_PRICE=?, LIVECOU_PUBDATE=?, LIVECOU_USEPERIOD=?  where LIVECOU_ID=?
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, liveCoupon.getLivecouName());
			ps.setInt(2, liveCoupon.getLivecouPrice());
			ps.setString(3, liveCoupon.getLivecouPubdate());
			ps.setInt(4, liveCoupon.getLivecouUseperiod());
			ps.setString(5, liveCoupon.getLivecouId());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int insertRgCp(RgCouponDTO rgCoupon) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("coupon.insertRgCp"); 
		//coupon.insertRgCp=insert into RGCOUPON values(?,?,?,sysdate,?)
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, rgCoupon.getRgcouId());
			ps.setString(2, rgCoupon.getRgcouName());
			ps.setInt(3, rgCoupon.getRgcouPrice());
			ps.setString(4, rgCoupon.getRgcouEnddate());
			
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	@Override
	public int updateRgCp(RgCouponDTO rgCoupon) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("coupon.updateRgCp"); 
		//coupon.updateRgCp=update RGCOUPON set RGCOU_NAME=?, RGCOU_PRICE=?, RGCOU_PUBDATE=?, RGCOU_ENDDATE=?  where RGCOU_ID=?
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, rgCoupon.getRgcouName());
			ps.setInt(2, rgCoupon.getRgcouPrice());
			ps.setString(3, rgCoupon.getRgcouPubdate());
			ps.setString(4, rgCoupon.getRgcouEnddate());
			ps.setString(5, rgCoupon.getRgcouId());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
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

	/**
	 * coupon.insertUserCpLiveCp=insert into USERCOUPON (USERCOU_ID, USER_ID, LIVECOU_ID, USERCOU_USEABLE, USERCOU_PUBDATE, USERCOU_ENDDATE) values(USERCOUPON_SEQ.NEXTVAL,?,?,?,?,?)
	 * coupon.insertUserCpRgCp=insert into USERCOUPON (USERCOU_ID, USER_ID, RGCOU_ID, USERCOU_USEABLE, USERCOU_PUBDATE, USERCOU_ENDDATE) values(USERCOUPON_SEQ.NEXTVAL,?,?,?,?,?)
	 * */
	@Override
	public int insertUserCp(UserCouponDTO userCoupon, String couponType) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql= null;
		
		//sql = proFile.getProperty("coupon.insertUserCpLiveCp");
		//insert into USERCOUPON(USERCOU_ID, USER_ID, LIVECOU_ID, USERCOU_USEABLE, USERCOU_PUBDATE, USERCOU_ENDDATE)
//		values(USERCOUPON_SEQ.NEXTVAL,?,?,?,?,?)
		
		//sql = proFile.getProperty("coupon.insertUserCpRgCp");
		//insert into USERCOUPON(USERCOU_ID, USER_ID, RGCOU_ID, USERCOU_USEABLE, USERCOU_PUBDATE, USERCOU_ENDDATE)
		// values(USERCOUPON_SEQ.NEXTVAL,?,?,?,?,?)
		 
		
		if(couponType.equals("LiveCp")) {
			sql = proFile.getProperty("coupon.insertUserCpLiveCp");
		}else if(couponType.equals("RgCp")){
			sql = proFile.getProperty("coupon.insertUserCpRgCp");
		}
		System.out.println(couponType);
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userCoupon.getUserId());
			
			if(couponType.equals("LiveCp")) {
				ps.setString(2, userCoupon.getLivecouId());
			}else if(couponType.equals("RgCp")){
				ps.setString(2, userCoupon.getRgcouId());
			}
			
			ps.setString(3, userCoupon.getUsercouUsable() );
			ps.setString(4, userCoupon.getUsercouPubdate() );
			ps.setString(5, userCoupon.getUsercouEnddate());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		
		return result;
	}

	@Override
	public int updateCpState(int usercouId, String state) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("coupon.updateCpState");
		// coupon.updateCpState=update USERCOUPON set USERCOU_USEABLE =? where USERCOU_ID =?
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, state);
			ps.setInt(2, usercouId);
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<UserCouponDTO> selectAllUserCp(String field) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("coupon.selectAllUserCpUserID");
		//SELECT * FROM USERCOUPON order by USER_ID asc
		//SELECT * FROM USERCOUPON order by USERCOU_PUBDATE asc
		//SELECT * FROM USERCOUPON order by USERCOU_ENDDATE desc
		List<UserCouponDTO> userCouponList = new ArrayList<UserCouponDTO>();
		SimpleDateFormat userCouponFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		
		if(field != null) {
			if (field.equals("PubDate")) {
				sql = proFile.getProperty("coupon.selectAllUserCpPubDate");
				
			} else if (field.equals("EndDate")){
				sql = proFile.getProperty("coupon.selectAllUserCpEndDate");
			}
		}
		
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserCouponDTO  userCoupon = new UserCouponDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), userCouponFormat.format(rs.getDate(6)), userCouponFormat.format(rs.getDate(7)));
				userCouponList.add(userCoupon);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userCouponList;
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
	
	public LiveCouponDTO selectLvCouByCouId(String livecouId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("coupon.selectLvCouByCouId");
		//coupon.selectLvCouByCouId=select * from LIVECOUPON where LIVECOU_ID = ?"
		LiveCouponDTO liveCoupon = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, livecouId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				liveCoupon = new LiveCouponDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return liveCoupon;
	}

	@Override
	public RgCouponDTO selectRcCouByCouId(String rgcouId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("coupon.selectRcCouByCouId");
		//coupon.selectRcCouByCouId=select * from RGCOUPON where RGCOU_ID = ?"
		RgCouponDTO RgCoupon = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, rgcouId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				RgCoupon = new RgCouponDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return RgCoupon;
	}
	

}
