package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.ReviewReplyDTO;
import mimemi.mvc.util.DbUtil;

public class ReviewReplyDAOImpl implements ReviewReplyDAO {
	private Properties proFile = new Properties();
	
	/**
	 * 게시글 조회할 때 달린 댓글도 같이 조회하는 메소드
	 * */
	@Override
	public List<ReviewReplyDTO> selectReplyByReviewNo(int reviewNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewReplyDTO> replylist = new ArrayList<ReviewReplyDTO>();
		String sql="select * from REVIEW_REPLY where REVIEW_NO=? order by REPLY_REGDATE desc";
		//String sql=proFile.getProperty("");
		SimpleDateFormat replyFormat = new SimpleDateFormat("yyyy-MM-dd HH시 mm분");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			rs =ps.executeQuery();
			
			while(rs.next()) {
				ReviewReplyDTO reply=new ReviewReplyDTO(
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						replyFormat.format(rs.getDate(6))
						);
				replylist.add(reply);
				//System.out.println(reply.getReplyContent());
			}

		}finally {
			DbUtil.dbClose(rs, ps, con);
		}	
		return replylist;
	}
	
	
	/**
	 * 댓글 등록
	 * */
	@Override
	public int insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql="INSERT INTO REVIEW_REPLY(REPLY_NO,REVIEW_NO,USER_ID,MANAGER_ID,REPLY_CONTENT,REPLY_REGDATE) VALUES(REPLY_NO_SEQ.NEXTVAL,?,?,?,?,SYSDATE)";
		//String sql=proFile.getProperty("");
		int result =0;
		
		try {
			con=DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewreplyDTO.getReviewNo());
			ps.setString(2, reviewreplyDTO.getUserId());
			ps.setString(3, reviewreplyDTO.getManagerId());
			ps.setString(4, reviewreplyDTO.getReplyContent());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	/**
	 * 댓글 수정
	 * */
	@Override
	public int updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 댓글 삭제
	 * */
	@Override
	public int deleteReviewReply(int replyNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps =null;
		String sql="delete from REVIEW_REPLY where REPLY_NO=?";
		//String sql=proFile.getProperty("");
		int result=0;
		
		try {
			con = DbUtil.getConnection();
			ps= con.prepareStatement(sql);
			ps.setInt(1, replyNo);
			
			result= ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 후기 게시물 삭제할때 해당 댓글 삭제하기
	 * */
	@Override
	public int deleteReviewReplyByReviewNo(Connection con,int reviewNo) throws SQLException {
		PreparedStatement ps =null;
		String sql="delete from REVIEW_REPLY where REVIEW_NO=?";
		//String sql=proFile.getProperty("");
		int result=0;
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			
			result =ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, null);
		}
		
		return result;
	}
	

}
