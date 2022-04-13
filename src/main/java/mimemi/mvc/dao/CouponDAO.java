package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.LiveCouponDTO;
import mimemi.mvc.dto.RgCouponDTO;
import mimemi.mvc.dto.UserCouponDTO;

public interface CouponDAO {
	/**
	 * 실시간 쿠폰 등록
	 * */
	int insertLiveCp(LiveCouponDTO liveCoupon) throws SQLException;
	
	/**
	 * 실시간 쿠폰 수정
	 * */
	int updateLiveCp(LiveCouponDTO liveCoupon) throws SQLException;
	
	/**
	 * 정기 쿠폰 등록
	 * */
	int insertRgCp(RgCouponDTO rgCoupon) throws SQLException;

	/**
	 * 정기 쿠폰 수정
	 * */
	int updateRgCp(RgCouponDTO rgCoupon) throws SQLException;

	/**
	 * 실시간 쿠폰 조회
	 * */
	List<LiveCouponDTO> selectAllLiveCp() throws SQLException;
	
	/**
	 * 정기 쿠폰 조회
	 * */
	List<RgCouponDTO> selectAllRgCp() throws SQLException;
	
	/**
	 * 사용자별 쿠폰 등록
	 * */
	int insertUserCp(UserCouponDTO userCoupon, String couponType) throws SQLException;
	
	/**
	 * 사용자별 쿠폰 사용여부 수정
	 * */
	int updateCpState(int usercouId, String state) throws SQLException;
	
	/**
	 * 전체 사용자 쿠폰 조회
	 * 발행순, 만료순 정렬
	 * */
	List<UserCouponDTO> selectAllUserCp(String field) throws SQLException;
	
	/**
	 * 사용자별 쿠폰 조회
	 * */
	List<UserCouponDTO> selectCpByUserId(String userId) throws SQLException;
	
}
