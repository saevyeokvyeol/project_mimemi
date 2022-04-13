package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.ReviewReplyDTO;


public interface ReviewReplyDAO {
	/**
	 * ´ñ±Û µî·Ï
	 * @param AnswerDTO(int answerNo, int askNo, String answerContent, String answerRegdate)
	 * */
	int insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;

	/**
	 * ´ñ±Û ¼öÁ¤ 
	 * @param AnswerDTO(int answerNo, int askNo, String answerContent, String answerRegdate)
	 * */
	int updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	int deleteReviewReply() throws SQLException;
}
