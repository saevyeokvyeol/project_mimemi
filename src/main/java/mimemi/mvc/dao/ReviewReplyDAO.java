package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.SQLException;

import mimemi.mvc.dto.ReviewReplyDTO;


public interface ReviewReplyDAO {
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
	int deleteReviewReply(int answerNo) throws SQLException;
	
	/**
	 * 후기 게시물 삭제할 때, 댓글 삭제
	 * */
	public int deleteReviewReplyByReviewNo(Connection con,int reviewNo) throws SQLException;
}
