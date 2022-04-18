package mimemi.mvc.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.ReviewDAO;
import mimemi.mvc.dao.ReviewDAOImpl;
import mimemi.mvc.dto.ReviewDTO;
import mimemi.mvc.dto.ReviewReplyDTO;

public class ReviewServiceImpl implements ReviewService {
	private ReviewDAO reviewDAO = new ReviewDAOImpl();

	@Override
	public void insertReview(ReviewDTO reviewDTO, String path) throws SQLException {
		int result= reviewDAO.insertReview(reviewDTO);
		
		//등록에 오류가 난다면
		if(result==0) {
			//첨부파일이 있다면 save폴더에 저장한 첨부파일 삭제하기
			if(reviewDTO.getReviewAttach()!=null) {
				new java.io.File(path+"/"+reviewDTO.getReviewAttach()).delete(); //경로확인하기
			}
			throw new SQLException("후기가 등록되지 않았습니다.");
		}

	}

	@Override
	public void updateReview(ReviewDTO reviewDTO, String path) throws SQLException {
		ReviewDTO dbreview = reviewDAO.selectByReviewNo(reviewDTO.getReviewNo());
			if(dbreview==null) {
				throw new SQLException("리뷰 번호에 해당하는 리뷰를 찾을 수 없습니다.");
			}else if(!dbreview.getUserId().equals(reviewDTO.getUserId())||dbreview.getUserId()==reviewDTO.getUserId()) {
				throw new SQLException("아이디가 일치하지 않습니다.게시물 수정 권한이 없습니다.");
			}
		//db저장한 기존 리뷰의 첨부파일명을 미리 구한다.
		String dbAttach =dbreview.getReviewAttach();
		
		//dao로 게시물 수정한다.
		int result = reviewDAO.updateReview(reviewDTO);
			
			if(result==0) {
				//첨부파일이 있다면 save폴더에 예전에 첨부한 첨부파일 삭제하기
				if(dbAttach!=null) {
					new java.io.File(path+"/"+dbAttach).delete(); //경로확인하기
				}
				throw new SQLException("수정되지 않았습니다.");
			}else {
				//첨부파일이 있다면 save폴더에 예전에 첨부한 첨부파일 삭제하기
				if(dbAttach!=null) {
					new java.io.File(path+"/"+dbAttach).delete(); //경로확인하기
				}
				System.out.println("삭제되야할 기존 파일이름:"+dbAttach);
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
	public void deleteReview(ReviewDTO review, String path) throws SQLException {
		//db에서 삭제한다.
		int result =reviewDAO.deleteReview(review.getReviewNo());
		if(result==0) {
			throw new SQLException("삭제에 오류가 생겨 삭제되지 않았습니다.");
		}
		//게시물을 삭제했다면 save 폴더에서 삭제한다.
		if(review.getReviewAttach()!=null) {
			new java.io.File(path+"/"+review.getReviewAttach()).delete();
		}
		System.out.println("폴더에서 삭제완료");

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
		//게시물 정보 가져오기
		ReviewDTO reviewDetail = reviewDAO.selectByReviewNo(reviewNo);
			if(reviewDetail==null) {
				throw new SQLException("게시물 상세보기를 불러올 수 없습니다.");
			}
		
		return reviewDetail;
	}
	
	/**
	 * 관리자 - 후기 전체조회(페이지처리)
	 * */
	@Override
	public List<ReviewDTO> selectAllByPagingManager(int pageNo, String field) throws SQLException {
		List<ReviewDTO> list =reviewDAO.selectAllByPagingManager(pageNo, field);
		
		return list;
	}
	
	/**
	 * 관리자 - 후기 블라인드처리
	 * */
	@Override
	public void updateBlind(int reviewNo, String blind) throws SQLException {
		int result =reviewDAO.updateBlind(reviewNo, blind);
		if(result==0) {
			throw new SQLException("블라인드 처리를 하는 도중 오류가 발생했습니다.");
		}
		

	}

}
