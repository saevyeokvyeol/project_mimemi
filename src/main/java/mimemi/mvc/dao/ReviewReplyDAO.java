package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.ReviewReplyDTO;


public interface ReviewReplyDAO {
	/**
	 * ´ñ±Û µî·Ï
	 * @param AnswerDTO(int askNo, String userId, String answerContent)
	 * */
	int insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;

	/**
	 * ´ñ±Û ¼öÁ¤ 
	 * @param AnswerDTO(int answerNo, String answerContent)
	 * */
	int updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	int deleteReviewReply(int answerNo) throws SQLException;
}
