package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewDTO;

public interface ReviewBoardDAO {
	/**
	 * 후기 등록
	 * @param ReviewDTO(String goodsId, String userId, String reviewTitle, String reviewAttach, String reviewContent,
			int reviewRate)
	 * */
	int insertReview(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 후기 수정 
	 * @param ReviewDTO(int reviewNo, String reviewTitle, String reviewContent, int reviewRate)
	 * */
	int updateReview(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 후기 삭제
	 * */
	int deleteReview(int reviewNo) throws SQLException;
	
	/**
	 * 블라인드 여부 변경 기능
	 * */
	int updateBlind(int reviewNo, String blind) throws SQLException;
	
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
	 * 조회수 증가 기능
	 * @param reviewNo
	 * */
	int increamentByReadnum(int reviewNo) throws SQLException;

}
