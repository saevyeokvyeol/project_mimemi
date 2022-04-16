package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.ReviewDTO;
import mimemi.mvc.dto.ReviewReplyDTO;
import mimemi.mvc.paging.PageCnt;
import mimemi.mvc.util.DbUtil;

public class ReviewDAOImpl implements ReviewDAO {
	private Properties proFile = new Properties();

	@Override
	public int insertReview(ReviewDTO reviewDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql ="INSERT INTO REVIEW(REVIEW_NO,USER_ID,Goods_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_ATTACH,REVIEW_REGDATE,REVIEW_RATE)"
				+ "VALUES(REVIEW_NO_SEQ.NEXTVAL,?,?,?,?,?,sysdate,?)";
		//String sql=proFile.getProperty("");
		int result =0;
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, reviewDTO.getUserId());
			ps.setString(2, reviewDTO.getGoodsId());
			ps.setString(3, reviewDTO.getReviewTitle());
			ps.setString(4, reviewDTO.getReviewContent());
			ps.setString(5, reviewDTO.getReviewAttach());
			ps.setInt(6, reviewDTO.getReviewRate());
			
			result=ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFaqImg(int reviewNo, String reviewAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int reviewNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBlind(int reviewNo, String blind) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewDTO> selectAllReview(String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewDTO> selectAllByPaging(int pageNo, String field) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql="select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW ORDER BY REVIEW_REGDATE desc) a) where  rnum>=? and rnum <=? ";
		//String sql=proFile.getProperty("");
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		SimpleDateFormat reviewFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		
		try {
			int totalCount =this.getTotalCount(field);
			int totalPage =totalCount%PageCnt.getPagesize()==0 ? totalCount/PageCnt.getPagesize() :  totalCount/PageCnt.getPagesize()+1;
			PageCnt pagecnt = new PageCnt();
			pagecnt.setPageCnt(totalPage);
			pagecnt.setPageNo(pageNo);
			
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			//페이지 처리 : ?에 들어갈 값 설정하기
			ps.setInt(1, ((pageNo-1)*PageCnt.pagesize)+1);
			ps.setInt(2, pageNo*PageCnt.pagesize);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ReviewDTO review = new ReviewDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						reviewFormat.format(rs.getDate(7)),
						rs.getInt(8),
						rs.getString(9),
						rs.getInt(10)
						);
				review.getGoodsDTO().setGoodsName("상품이름");
				review.getUserDTO().setUserName("작성자 이름");//홍*동처럼 보안처리나중에 하기
				list.add(review);
				//System.out.println(review.getReviewRegdate());
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}

	/*전체 레코드 수 가져오기*/
	private int getTotalCount(String field) throws SQLException{
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		int totalCount=0;
		String sql="select*from review order by review_regdate desc";
		//String sql=proFile.getProperty("");
		//나중에 카테고리별 if문 이용해서 다른 sql문 사용하기
		
		try {
			con=DbUtil.getConnection();
			ps =con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				totalCount=rs.getInt(1);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return totalCount;
	}

	@Override
	public List<ReviewDTO> selectByKeyword(String reviewKeyword, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewDTO selectByReviewNo(int reviewNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql="select * from review where REVIEW_NO=?";
		//String sql=proFile.getProperty("");
		ReviewDTO reviewDetail = null; 
		SimpleDateFormat reviewFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				reviewDetail = new ReviewDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						reviewFormat.format(rs.getDate(7)),
						rs.getInt(8),
						rs.getString(9),
						rs.getInt(10)
						);
				reviewDetail.getGoodsDTO().setGoodsName("리뷰 상세보기:상품이름");
				reviewDetail.getGoodsDTO().setGoodsThumbnail("상품 썸네일이미지");
				reviewDetail.getUserDTO().setUserName("리뷰상세보기:작성자 이름"); //홍*동처럼 보안처리나중에 하기
				System.out.println("상세보기 할 리뷰번호:"+reviewDetail.getReviewNo());
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return reviewDetail;
	}

	@Override
	public int increamentByReadnum(int reviewNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		int result =0;
		String sql="update review set REVIEW_VIEWS=REVIEW_VIEWS+1 where REVIEW_NO=?";
		//String sql=proFile.getProperty("");
		
		try {
			con =DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			result =ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<ReviewReplyDTO> selectReplyByReviewNo(int reviewNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
