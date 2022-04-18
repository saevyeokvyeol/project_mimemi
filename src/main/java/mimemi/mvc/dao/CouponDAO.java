package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.LiveCouponDTO;
import mimemi.mvc.dto.RgCouponDTO;
import mimemi.mvc.dto.UserCouponDTO;

public interface CouponDAO {
	/**
	 * 실시간 쿠폰 등록
	 * @param: LiveCouponDTO(String livecouId, String livecouName, int livecouPrice, int livecouUseperiod)
	 * @return: int(등록된 레코드 수)
	 * */
	int insertLiveCp(LiveCouponDTO liveCoupon) throws SQLException;
	
	/**
	 * 실시간 쿠폰 수정
	 * @param: LiveCouponDTO(String livecouId, String livecouName, int livecouPrice, int livecouUseperiod)
	 * @return: int(수정된 레코드 수)
	 * */
	int updateLiveCp(LiveCouponDTO liveCoupon) throws SQLException;
	
	/**
	 * 정기 쿠폰 등록
	 * @param: RgCouponDTO(String rgcouId, String rgcouName, int rgcouPrice, String rgcouPubdate, String rgcouEnddate)
	 * @return: int(등록된 레코드 수)
	 * */
	int insertRgCp(RgCouponDTO rgCoupon) throws SQLException;

	/**
	 * 정기 쿠폰 수정
	 * @param: RgCouponDTO(String rgcouId, String rgcouName, int rgcouPrice, String rgcouPubdate, String rgcouEnddate)
	 * @return: int(수정된 레코드 수)
	 * */
	int updateRgCp(RgCouponDTO rgCoupon) throws SQLException;

	/**
	 * 실시간 쿠폰 조회
	 * @return: LiveCouponDTO
	 * */
	List<LiveCouponDTO> selectAllLiveCp() throws SQLException;
	
	/**
	 * 정기 쿠폰 조회
	 * @return: RgCouponDTO
	 * */
	List<RgCouponDTO> selectAllRgCp() throws SQLException;
	
	/**
	 * 사용자별 쿠폰 등록
	 * @param: UserCouponDTO(String userId, String livecouId | rgcouId, String usercouPubdate, String usercouEnddate)
	 * 			String couponType(실시간 쿠폰, 정기 쿠폰인지 구분해 if문으로 쿼리문 선택)
	 * @return: int(등록된 레코드 수)
	 * */
	int insertUserCp(UserCouponDTO userCoupon, String couponType) throws SQLException;
	
	/**
	 * 사용자별 쿠폰 사용여부 수정
	 * @param: int usercouId, String state(유저 아이디와 쿠폰 사용 여부)
	 * @return: int(수정된 레코드 수)
	 * */
	int updateCpState(int usercouId, String state) throws SQLException;
	
	/**
	 * 전체 사용자 쿠폰 조회
	 * 발행순, 만료순 정렬
	 * @param: String field(정렬 기준을 인수로 가져와 if문으로 쿼리문 선택)
	 * @return: UserCouponDTO
	 * */
	List<UserCouponDTO> selectAllUserCp(String field) throws SQLException;
	
	/**
	 * 사용자별 쿠폰 조회
	 * @param: String userId
	 * @return: UserCouponDTO(회원 아이디로 검색된 전체 레코드)
	 * */
	List<UserCouponDTO> selectCpByUserId(String userId) throws SQLException;
	
	/**
	 * LiveCoupon 쿠폰 조회
	 * @param: String userId
	 * @return: UserCouponDTO(회원 아이디로 검색된 전체 레코드)
	 * */
	LiveCouponDTO selectLvCouByCouId(String livecouId) throws SQLException;
	
	/**
	 * RgCoupon 쿠폰 조회
	 * @param: String userId
	 * @return: UserCouponDTO(회원 아이디로 검색된 전체 레코드)
	 * */
	RgCouponDTO selectRcCouByCouId(String rgcouId) throws SQLException;
	
}
