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
import oracle.jdbc.proxy.annotation.Pre;

public class ReviewDAOImpl implements ReviewDAO {
	private Properties proFile = new Properties();
	private ReviewReplyDAO reviewReplyDAO = new ReviewReplyDAOImpl();

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
		Connection con =null;
		PreparedStatement ps = null;
		String sql ="update review set GOODS_ID=?, REVIEW_TITLE=?,REVIEW_CONTENT=?,REVIEW_RATE=? where REVIEW_NO =?";
		//String sql=proFile.getProperty("");
		int result = 0;
		try {
			con= DbUtil.getConnection();
			con.setAutoCommit(false);
			
			ps =con.prepareStatement(sql);
			ps.setString(1, reviewDTO.getGoodsId());
			ps.setString(2, reviewDTO.getReviewTitle());
			ps.setString(3, reviewDTO.getReviewContent());
			ps.setInt(4, reviewDTO.getReviewRate());
			ps.setInt(5, reviewDTO.getReviewNo());
			
			result = ps.executeUpdate();
			if(result==0) {
				con.rollback();
				throw new SQLException("�ı� ������ �����߽��ϴ�.");
			}else {
				//������ ������ ���� �ִٸ�, ���� �����Ѵ�.
				if(reviewDTO.getReviewAttach()!=null) {
					int re = updateFaqImgCon(con,reviewDTO.getReviewNo(),reviewDTO.getReviewAttach());
						if(re!=1) {
							con.rollback();
							throw new SQLException("�ı� ���� ������ �����߽��ϴ�.");
						}
				}
				con.commit();
			}
		}finally {
			con.commit();
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/*�ı� �Խñ� ������ ��, �̹����� �����ϴ� �޼ҵ�*/
	public int updateFaqImgCon(Connection con,int reviewNo, String reviewAttach) throws SQLException {
		PreparedStatement ps =null;
		String sql ="update review set REVIEW_ATTACH=? where REVIEW_NO =?";
		//String sql=proFile.getProperty("");
		int result =0;
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, reviewAttach);
			ps.setInt(2, reviewNo);
			
			result=ps.executeUpdate();
			System.out.println("�̹������� ...dao");
		}finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	} 
	
	@Override
	public int updateFaqImg(int reviewNo, String reviewAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int reviewNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql="delete from review where REVIEW_NO=?";
		//String sql=proFile.getProperty("");
		int result=0;
		
		try {
			con =DbUtil.getConnection();
			int re = reviewReplyDAO.deleteReviewReplyByReviewNo(con, reviewNo);
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			
			result= ps.executeUpdate();
			System.out.println("dao: ������ �����ȣ "+reviewNo);
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
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
		String sql= null;
		//String sql=proFile.getProperty("");
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		SimpleDateFormat reviewFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		if (field != null) {
			if (field.equals("reg")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW where REVIEW_BLIND='F' ORDER BY REVIEW_REGDATE desc) a) where  rnum>=? and rnum <=? ";
				//sql = proFile.getProperty("review.selectAllReg");
			} else if (field.equals("higirate")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW where REVIEW_BLIND='F' ORDER BY REVIEW_RATE desc) a) where  rnum>=? and rnum <=?";
				//sql = proFile.getProperty("review.selectAllHigirate");
			} else if (field.equals("rowrate")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW where REVIEW_BLIND='F' ORDER BY REVIEW_RATE asc) a) where  rnum>=? and rnum <=?";
				//sql = proFile.getProperty("review.selectAllRowrate");
			} else if (field.equals("view")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW where REVIEW_BLIND='F' ORDER BY REVIEW_VIEWS desc) a) where  rnum>=? and rnum <=?";
				//sql = proFile.getProperty("review.selectAllView");
			} 
		}
		try {
			int totalCount =this.getTotalCount(field);
			int totalPage =totalCount%PageCnt.getPagesize()==0 ? totalCount/PageCnt.getPagesize() :  totalCount/PageCnt.getPagesize()+1;
			PageCnt pagecnt = new PageCnt();
			pagecnt.setPageCnt(totalPage);
			pagecnt.setPageNo(pageNo);
			
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			//������ ó�� : ?�� �� �� �����ϱ�
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
				review.getGoodsDTO().setGoodsName("��ǰ�̸�");
				review.getUserDTO().setUserName("�ۼ��� �̸�");//ȫ*��ó�� ����ó�����߿� �ϱ�
				list.add(review);
				//System.out.println(review.getReviewRegdate());
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	/**
	 * ��ü ���ڵ� �� ��������
	 * */
	private int getTotalCount(String field) throws SQLException{
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		int totalCount=0;
		String sql="select count(*) from review where REVIEW_BLIND='F'";
		//String sql=proFile.getProperty("review.totalCount");
		
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
	
	/**
	 * �Խù��˻�
	 * */
	@Override
	public List<ReviewDTO> selectByKeyword(String reviewKeyword, String field, int pageNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql="";
		//String sql=proFile.getProperty("");
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		SimpleDateFormat reviewFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		if(field.equals("title")){
			sql="select * from (select rv.*, rownum from (select* from review where REVIEW_TITLE like ? order by review_no desc) rv) where rownum>=? and rownum<=?";
			//sql=proFile.getProperty("");
		}else if(field.equals("content")) {
			sql="select * from (select rv.*, rownum from (select* from review where REVIEW_CONTENT like ? order by review_no desc) rv) where rownum>=? and rownum<=?";
			//sql=proFile.getProperty("");
		}
		
		try {
			int totalCount =this.getTotalCountByKeyword(reviewKeyword,field);
			int totalPage =totalCount%PageCnt.getPagesize()==0 ? totalCount/PageCnt.getPagesize() :  totalCount/PageCnt.getPagesize()+1;
			PageCnt pagecnt = new PageCnt();
			pagecnt.setPageCnt(totalPage);
			pagecnt.setPageNo(pageNo);
			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+reviewKeyword+"%");
			
			//������ ó�� : ?�� �� �� �����ϱ�
			ps.setInt(2, ((pageNo-1)*PageCnt.pagesize)+1);
			ps.setInt(3, pageNo*PageCnt.pagesize);
			
			rs= ps.executeQuery();
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
				review.getGoodsDTO().setGoodsName("��ǰ�̸�");
				review.getUserDTO().setUserName("�ۼ��� �̸�");//ȫ*��ó�� ����ó�����߿� �ϱ�
				list.add(review);
				//System.out.println(review.getReviewRegdate());
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
	/**
	 * ��ü ���ڵ� �� ��������
	 * */
	private int getTotalCountByKeyword(String keyword, String field) throws SQLException{
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		int totalCount=0;
		String sql="";
		//String sql=proFile.getProperty("review.totalCount");
		
		
		if(field.equals("title")){
			sql="select count(*) from review where REVIEW_BLIND='F' and REVIEW_TITLE like ?";
			//sql=proFile.getProperty("");
		}else if(field.equals("content")) {
			sql="select count(*) from review where REVIEW_BLIND='F' and REVIEW_CONTENT like ?";
			//sql=proFile.getProperty("");
		}
		
		
		try {
			con=DbUtil.getConnection();
			ps =con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
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
				reviewDetail.getGoodsDTO().setGoodsName("���� �󼼺���:��ǰ�̸�");
				reviewDetail.getGoodsDTO().setGoodsThumbnail("��ǰ ������̹���");
				reviewDetail.getUserDTO().setUserName("����󼼺���:�ۼ��� �̸�"); //ȫ*��ó�� ����ó�����߿� �ϱ�
				System.out.println("�󼼺��� �� �����ȣ:"+reviewDetail.getReviewNo());
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

	
	
	
	/**
	 * ������ - �ı� ��ü ��ȸ
	 * */
	@Override
	public List<ReviewDTO> selectAllByPagingManager(int pageNo, String field) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql= null;
		//String sql=proFile.getProperty("");
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		SimpleDateFormat reviewFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		if (field != null) {
			if (field.equals("reg")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW ORDER BY REVIEW_REGDATE desc) a) where  rnum>=? and rnum <=? ";
				//sql = proFile.getProperty("review.selectAllRegManager");
			} else if (field.equals("higirate")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW ORDER BY REVIEW_RATE desc) a) where  rnum>=? and rnum <=?";
				//sql = proFile.getProperty("review.selectAllHigirateManager");
			} else if (field.equals("rowrate")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW ORDER BY REVIEW_RATE asc) a) where  rnum>=? and rnum <=?";
				//sql = proFile.getProperty("review.selectAllRowrateManager");
			} else if (field.equals("view")) {
				sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM REVIEW ORDER BY REVIEW_VIEWS desc) a) where  rnum>=? and rnum <=?";
				//sql = proFile.getProperty("review.selectAllViewManager");
			} 
		}
		try {
			int totalCount =this.getTotalCountManager(field);
			int totalPage =totalCount%PageCnt.getPagesize()==0 ? totalCount/PageCnt.getPagesize() :  totalCount/PageCnt.getPagesize()+1;
			PageCnt pagecnt = new PageCnt();
			pagecnt.setPageCnt(totalPage);
			pagecnt.setPageNo(pageNo);
			
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			//������ ó�� : ?�� �� �� �����ϱ�
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
				
				review.getGoodsDTO().setGoodsName("��ǰ�̸�");
				review.getUserDTO().setUserName("�ۼ��� �̸�");//ȫ*��ó�� ����ó�����߿� �ϱ�
				list.add(review);
				//System.out.println(review.getReviewBlind());
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	/**
	 * ������ - ��ü ���ڵ� �� ��������
	 * */
	private int getTotalCountManager(String field) throws SQLException{
		Connection con =null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		int totalCount=0;
		String sql="select count(*) from review";
		//String sql=proFile.getProperty("review.totalCountManager");
		
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
	
	/**
	 * ������ - �����ε�ó��
	 * */
	@Override
	public int updateBlind(int reviewNo, String blind) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		int result=0;
		String sql=null;
		
		if (blind != null) {
			if (blind.equals("F")) {
				sql = "update review set REVIEW_BLIND='T' where REVIEW_NO=?";
				//sql = proFile.getProperty("review.updateBlindToT");
			} else if (blind.equals("T")) {
				sql = "update review set REVIEW_BLIND='F' where REVIEW_NO=?";
				//sql = proFile.getProperty("review.updateBlindToF");
			}
		}
			
		try {
			con=DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			
			result=ps.executeUpdate();
					
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

}