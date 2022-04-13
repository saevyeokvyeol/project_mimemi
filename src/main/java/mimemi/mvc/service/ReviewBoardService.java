package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewDTO;

public interface ReviewBoardService {
	/**
	 * 후기 등록
	 * */
	void insertReview(ReviewDTO reviewDTO) throws SQLException;
	/**
	 * 후기 수정 
	 * */
	void updateReview(ReviewDTO reviewDTO) throws SQLException;
	/**
	 * 후기 삭제
	 * */
	void deleteReview(String reviewPwd) throws SQLException;
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
	 * */
	void increamentByReadnum(int reviewNo) throws SQLException;
}
