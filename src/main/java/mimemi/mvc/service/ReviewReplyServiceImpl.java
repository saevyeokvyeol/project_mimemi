package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.ReviewReplyDAO;
import mimemi.mvc.dao.ReviewReplyDAOImpl;
import mimemi.mvc.dto.ReviewReplyDTO;

public class ReviewReplyServiceImpl implements ReviewReplyService {
	private ReviewReplyDAO replyDAO = new ReviewReplyDAOImpl();
	
	@Override
	public List<ReviewReplyDTO> selectReplyByReviewNo(int reviewNo) throws SQLException {
		//댓글정보 가져오기
		List<ReviewReplyDTO> replylist =replyDAO.selectReplyByReviewNo(reviewNo);
		return replylist;
	}

	@Override
	public void insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReviewReply(int answerNo) throws SQLException {
		// TODO Auto-generated method stub

	}

}
