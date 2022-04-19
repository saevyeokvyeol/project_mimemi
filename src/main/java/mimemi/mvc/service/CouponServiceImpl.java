package mimemi.mvc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.CouponDAO;
import mimemi.mvc.dao.CouponDAOImpl;
import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.LiveCouponDTO;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.RgCouponDTO;
import mimemi.mvc.dto.UserCouponDTO;
import mimemi.mvc.util.DbUtil;

public class CouponServiceImpl implements CouponService {
	private CouponDAO couponDAO = new CouponDAOImpl();
	
	/**
	 * 실시간 쿠폰 등록
	 * @param: LiveCouponDTO(String livecouId, String livecouName, int livecouPrice, int livecouUseperiod)
	 * */
	@Override
	public void insertLiveCp(LiveCouponDTO liveCoupon) throws SQLException {
		int result = couponDAO.insertLiveCp(liveCoupon);
		
		if(result == 0) {
			throw new SQLException();
		}
	}

	/**
	 * 실시간 쿠폰 수정
	 * @param: LiveCouponDTO(String livecouId, String livecouName, int livecouPrice, int livecouUseperiod)
	 * */
	@Override
	public void updateLiveCp(LiveCouponDTO liveCoupon) throws SQLException {
		int result = couponDAO.updateLiveCp(liveCoupon);
		
		if(result == 0) {
			throw new SQLException();
		}

	}
	
	/**
	 * 정기 쿠폰 등록
	 * @param: RgCouponDTO(String rgcouId, String rgcouName, int rgcouPrice, String rgcouPubdate, String rgcouEnddate)
	 * */
	@Override
	public void insertRgCp(RgCouponDTO rgCoupon) throws SQLException {
		int result = couponDAO.insertRgCp(rgCoupon);
		
		if(result == 0) {
			throw new SQLException();
		}

	}
	
	/**
	 * 정기 쿠폰 수정
	 * @param: RgCouponDTO(String rgcouId, String rgcouName, int rgcouPrice, String rgcouPubdate, String rgcouEnddate)
	 * */
	@Override
	public void updateRgCp(RgCouponDTO rgCoupon) throws SQLException {
		int result = couponDAO.updateRgCp(rgCoupon);
		
		if(result == 0) {
			throw new SQLException();
		}
	}
	
	/**
	 * 실시간 쿠폰 조회
	 * @return: LiveCouponDTO
	 * */
	@Override
	public List<LiveCouponDTO> selectAllLiveCp() throws SQLException {
		List<LiveCouponDTO> list = couponDAO.selectAllLiveCp();
		
		return list;
	}

	/**
	 * 정기 쿠폰 조회
	 * @return: RgCouponDTO
	 * */
	@Override
	public List<RgCouponDTO> selectAllRgCp() throws SQLException {
		List<RgCouponDTO> list = couponDAO.selectAllRgCp();
		
		return list;
	}

	/**
	 * 사용자별 쿠폰 등록
	 * @param: UserCouponDTO(String userId, String livecouId | rgcouId, String usercouPubdate, String usercouEnddate)
	 * 			String couponType(실시간 쿠폰, 정기 쿠폰인지 구분해 if문으로 쿼리문 선택)
	 * */
	@Override
	public void insertUserCp(UserCouponDTO userCoupon, String couponType) throws SQLException {
		int result = couponDAO.insertUserCp(userCoupon, couponType);
		
		if(result == 0) {
			throw new SQLException();
		}
		
	}

	/**
	 * 사용자별 쿠폰 사용여부 수정
	 * @param: int usercouId, String state(유저 아이디와 쿠폰 사용 여부)
	 * */
	@Override
	public void updateCpState(int usercouId, String state) throws SQLException {
		int result = couponDAO.updateCpState(usercouId, state);
		
		if(result == 0) {
			throw new SQLException();
		}

	}

	/**
	 * 전체 사용자 쿠폰 조회
	 * 발행순, 만료순 정렬
	 * @param: String field(정렬 기준을 인수로 가져와 if문으로 쿼리문 선택)
	 * @return: UserCouponDTO
	 * */
	@Override
	public List<UserCouponDTO> selectAllUserCp(String field) throws SQLException {
		List<UserCouponDTO> userCouponList = couponDAO.selectAllUserCp(field);
		
		return userCouponList;
	}

	/**
	 * 사용자별 쿠폰 조회
	 * @param: String userId
	 * @return: UserCouponDTO(회원 아이디로 검색된 전체 레코드)
	 * */
	@Override
	public List<UserCouponDTO> selectCpByUserId(String userId) throws SQLException {
		List<UserCouponDTO> list = couponDAO.selectCpByUserId(userId);
		
		return list;
	}
	
	/**
	 * LiveCoupon을 쿠폰 아이디로 찾기
	 * */
	public LiveCouponDTO selectLvCouByCouId(String livecouId) throws SQLException {
		LiveCouponDTO liveCoupon = couponDAO.selectLvCouByCouId(livecouId);
		
		return liveCoupon;
	}

	/**
	 * RgCoupon을 쿠폰 아이디로 찾기
	 * */
	@Override
	public RgCouponDTO selectRgCouByCouId(String rgcouId) throws SQLException {
		RgCouponDTO rgCoupon = couponDAO.selectRcCouByCouId(rgcouId);
		
		return rgCoupon;
	}

}
