package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.ReviewReplyDTO;

public interface AnswerBoardDAO {
	/**
	 * ´ñ±Û µî·Ï
	 * */
	int insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;

	/**
	 * ´ñ±Û ¼öÁ¤ 
	 * */
	int updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException;
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	int deleteReviewReply() throws SQLException;
	
}
