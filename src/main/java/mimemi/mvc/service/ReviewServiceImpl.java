package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.ReviewDTO;

public class ReviewServiceImpl implements ReviewService {

	@Override
	public void insertReview(ReviewDTO reviewDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReview(ReviewDTO reviewDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateFaqImg(int reviewNo, String reviewAttach) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReview(int reviewNo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBlind(int reviewNo, String blind) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ReviewDTO> selectAllReview(String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewDTO> selectAllByPaging(int pageNo, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewDTO> selectByKeyword(String reviewKeyword, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewDTO selectByReviewNo(int reviewNo, boolean flag) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
