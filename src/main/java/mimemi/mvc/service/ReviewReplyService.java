package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewReplyDTO;

public interface ReviewReplyService {
	/**
	 * 후기 댓글조회하기
	 * */
	List<ReviewReplyDTO> selectReplyByReviewNo (int reviewNo) throws SQLException;
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
}
