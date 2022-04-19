package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewReplyDTO;


public interface ReviewReplyDAO {
	/**
	 * 각 후기에 해당하는 댓글 정보 가져오기
	 * */
	List<ReviewReplyDTO> selectReplyByReviewNo(int reviewNo) throws SQLException;
	/**
	 * 댓글 등록
	 * @param AnswerDTO(int askNo, String userId, String answerContent)
	 * */
	int insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;

	/**
	 * 댓글 수정 
	 * @param AnswerDTO(int answerNo, String answerContent)
	 * */
	int updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;
	
	/**
	 * 댓글 삭제
	 * */
	int deleteReviewReply(int replyNo) throws SQLException;
	
	/**
	 * 후기 게시물 삭제할 때, 댓글 삭제
	 * */
	public int deleteReviewReplyByReviewNo(Connection con,int reviewNo) throws SQLException;
}
