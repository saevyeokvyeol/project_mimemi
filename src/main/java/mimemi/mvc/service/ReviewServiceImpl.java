package mimemi.mvc.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.ReviewDAO;
import mimemi.mvc.dao.ReviewDAOImpl;
import mimemi.mvc.dto.ReviewDTO;

public class ReviewServiceImpl implements ReviewService {
	private ReviewDAO reviewDAO = new ReviewDAOImpl();

	@Override
	public void insertReview(ReviewDTO reviewDTO) throws SQLException {
		int result= reviewDAO.insertReview(reviewDTO);
		if(result==0) {
			
			//첨부파일 삭제하기
			File savedfile = new File("/img/save/"+reviewDTO.getReviewAttach());
			if(savedfile.exists()) {
				savedfile.delete();
				
			}
			
			throw new SQLException("후기가 등록되지 않았습니다.");
			
		}

	}

	@Override
	public void updateReview(ReviewDTO reviewDTO) throws SQLException {
		ReviewDTO dbreview = reviewDAO.selectByReviewNo(reviewDTO.getReviewNo());
			if(dbreview==null) {
				throw new SQLException("리뷰 번호에 해당하는 리뷰를 찾을 수 없습니다.");
			}else if(!dbreview.getUserId().equals(reviewDTO.getUserId())||dbreview.getUserId()==reviewDTO.getUserId()) {
				throw new SQLException("아이디가 일치하지 않습니다.게시물 수정 권한이 없습니다.");
			}
		int result = reviewDAO.updateReview(reviewDTO);
			if(result==0) {
				throw new SQLException("수정되지 않았습니다.");
			}

	}

	@Override
	public void updateFaqImg(int reviewNo, String reviewAttach) throws SQLException {
		/*ReviewDTO dbreview = reviewDAO.selectByReviewNo(reviewNo);
		if(dbreview==null) {
			throw new SQLException("리뷰 번호에 해당하는 리뷰를 찾을 수 없습니다.");
		}*/

	}

	@Override
	public void deleteReview(int reviewNo, String path) throws SQLException {
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
		List<ReviewDTO> list =reviewDAO.selectAllByPaging(pageNo, field);
		
		return list;
	}

	@Override
	public List<ReviewDTO> selectByKeyword(String reviewKeyword, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewDTO selectByReviewNo(int reviewNo, boolean flag) throws SQLException {
		//조회수 증가
		if(flag) {
			if(reviewDAO.increamentByReadnum(reviewNo)==0) {
				throw new SQLException("조회수 증가를 하는 도중 오류가 생겼습니다.");
			}
		}
		ReviewDTO reviewDetail = reviewDAO.selectByReviewNo(reviewNo);
			if(reviewDetail==null) {
				throw new SQLException("상세보기를 불러올 수 없습니다.");
			}
		//댓글정보 가져오기
		
		return reviewDetail;
	}

}
