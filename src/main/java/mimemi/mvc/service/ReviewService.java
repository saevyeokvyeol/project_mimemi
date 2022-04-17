package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewDTO;

public interface ReviewService {
	/**
	 * 후기 등록
	 * @param ReviewDTO(String goodsId, String userId, String reviewTitle, String reviewAttach, String reviewContent,
			int reviewRate)
	 * */
	void insertReview(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 후기 수정 
	 * @param ReviewDTO(int reviewNo, String reviewTitle, String reviewContent, int reviewRate)
	 * */
	void updateReview(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 후기 이미지 수정
	 * @param int reviewNo, String reviewAttach
	 * */
	void updateFaqImg(int reviewNo, String reviewAttach) throws SQLException;
	
	/**
	 * 후기 삭제
	 * */
	void deleteReview(ReviewDTO review,String path) throws SQLException;
	
	/**
	 * 블라인드 여부 변경 기능
	 * */
	void updateBlind(int reviewNo, String blind) throws SQLException;
	
	/**
	 * 후기 전체 검색
	 * field -> 조회수, 등록순, 댓글순, 별점순(낮은순+높은순)
	 * */
	List<ReviewDTO> selectAllReview(String field) throws SQLException;
	
	/**
	 * 후기 전체 검색(페이지 처리)
	 * field -> 조회수, 등록순, 댓글순, 별점순(낮은순+높은순)
	 * */
	List<ReviewDTO> selectAllByPaging(int pageNo, String field) throws SQLException;
	
	/**
	 * 후기 키워드별 검색
	 * 제목, 내용에서 검색 가능할 수 있게
	 * */
	List<ReviewDTO> selectByKeyword(String reviewKeyword, String field) throws SQLException;
	
	/**
	 * 후기번호로 검색하기(제목클릭하면 리뷰 상세보기로 이동)
	 * @param int reviewNo, int flag(조회수 증가 여부를 판별하는 매개변수. true면 조회수 증가, false면 조회수 그대로)
	 * @return ReviewDTO
	 * */
	ReviewDTO selectByReviewNo(int reviewNo, boolean flag) throws SQLException;
	
}
