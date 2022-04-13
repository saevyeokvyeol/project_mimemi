package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewDTO;

public interface ReviewBoardDAO {
	/**
	 * 후기 등록
	 * @param ReviewDTO(int reviewNo, String userId, String reviewTitle, String reviewAttach, String reviewContent,
			String reviewRegdate, int reviewRate, boolean reviewBlind, int reviewViews)
	 * */
	int insertReview(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 후기 수정 
	 * @param ReviewDTO(int reviewNo, String userId, String reviewTitle, String reviewAttach, String reviewContent,
			String reviewRegdate, int reviewRate, boolean reviewBlind, int reviewViews)
	 * */
	int updateReview(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 후기 이미지 수정
	 * @param int reviewNo, String reviewAttach
	 * */
	int updateFaqImg(int reviewNo, String reviewAttach) throws SQLException;
	
	/**
	 * 후기 삭제
	 * */
	int deleteReview(String reviewPwd) throws SQLException;
	
	/**
	 * 후기 전체 검색
	 * */
	List<ReviewDTO> selectAllReview() throws SQLException;
	
	/**
	 * 후기 전체 검색(페이지 처리)
	 * */
	List<ReviewDTO> getReviewList(int pageNo) throws SQLException;
	
	/**
	 * 조회수 증가 기능
	 * @param reviewNo
	 * */
	int increamentByReadnum(int reviewNo) throws SQLException;

}
