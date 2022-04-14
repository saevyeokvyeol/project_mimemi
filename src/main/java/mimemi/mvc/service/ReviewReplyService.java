package mimemi.mvc.service;

import java.sql.SQLException;

import mimemi.mvc.dto.ReviewReplyDTO;

public interface ReviewReplyService {
	/**
	 * ´ñ±Û µî·Ï
	 * @param AnswerDTO(int askNo, String userId, String answerContent)
	 * */
	void insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;

	/**
	 * ´ñ±Û ¼öÁ¤ 
	 * @param AnswerDTO(int answerNo, String answerContent)
	 * */
	void updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	void deleteReviewReply(int answerNo) throws SQLException;
}
