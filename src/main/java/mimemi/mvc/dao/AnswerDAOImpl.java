package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import mimemi.mvc.dto.AnswerDTO;

public class AnswerDAOImpl implements AnswerDAO {

	private Properties proFile = new Properties();
	
	//관리자 1:1문의 댓글 등록
	@Override
	public int insertAnswerReply(AnswerDTO answerDTO) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		
		return 0;
	}

	@Override
	public int updateAnswerReply(AnswerDTO answerDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAnswerReply(int answerNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
