package mimemi.mvc.service;

import java.sql.SQLException;

import mimemi.mvc.dto.ReviewReplyDTO;

public interface AnswerBoardService {
	/**
	 * ´ñ±Û µî·Ï
	 * */
	void insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;

	/**
	 * ´ñ±Û ¼öÁ¤ 
	 * */
	void updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	void deleteReviewReply() throws SQLException;
	
}
