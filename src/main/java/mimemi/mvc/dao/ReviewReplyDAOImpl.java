package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import mimemi.mvc.dto.ReviewReplyDTO;
import mimemi.mvc.util.DbUtil;

public class ReviewReplyDAOImpl implements ReviewReplyDAO {
	private Properties proFile = new Properties();
	
	@Override
	public int insertReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReviewReply(ReviewReplyDTO reviewreplyDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReviewReply(int answerNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps =null;
		String sql="delete from REVIEW_REPLY where REPLY_NO=?";
		//String sql=proFile.getProperty("");
		
		return 0;
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
