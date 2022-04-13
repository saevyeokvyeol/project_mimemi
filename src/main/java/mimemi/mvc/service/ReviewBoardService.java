package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewDTO;

public interface ReviewBoardService {
	/**
	 * 후기 등록
	 * @param ReviewDTO
	 * */
	void insertReview(ReviewDTO reviewDTO) throws SQLException;
	/**
	 * 후기 수정
	 * @param ReviewDTO
	 * */
	void updateReview(ReviewDTO reviewDTO) throws SQLException;
	/**
	 * 후기 삭제
	 * @param reviewPwd
	 * */
	void deleteReview(String reviewPwd) throws SQLException;
	/**
	 * 후기 전체 검색
	 * :후기 전부 뽑아오기
	 * */
	List<ReviewDTO> selectAllReview() throws SQLException;
	
	/**
	 * 후기 전체 검색(페이지 처리) -> 이 기능 필요한지
	 * @param int pageNo
	 * */
	List<ReviewDTO> getReviewList(int pageNo) throws SQLException;
	/**
	 * 조회수 증가 기능
	 * @param int reviewNo
	 * */
	void increamentByReadnum(int reviewNo) throws SQLException;
}
