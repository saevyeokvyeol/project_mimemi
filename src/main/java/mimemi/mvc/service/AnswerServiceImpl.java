package mimemi.mvc.service;

import java.sql.SQLException;

import mimemi.mvc.dao.AnswerDAO;
import mimemi.mvc.dao.AnswerDAOImpl;
import mimemi.mvc.dto.AnswerDTO;

public class AnswerServiceImpl implements AnswerService {

	private AnswerDAO answerDao= new AnswerDAOImpl();
	
	@Override
	public void insertAnswerReply(AnswerDTO answerDTO) throws SQLException {
		int result = answerDao.insertAnswerReply(answerDTO);
		if( result == 0) throw new SQLException("등록되지 않았습니다");

	}

	/**
	 * 댓글보기
	 * */
	@Override
	public AnswerDTO selectByAskNo(int askNo) throws SQLException {
		
		AnswerDTO answerDto = answerDao.selectByAskNo(askNo);
		if(answerDto==null)throw new SQLException("댓글보기에 오류가 발생했습니다");
		
		return answerDto;
	}
	
	@Override
	public void updateAnswerReply(AnswerDTO answerDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAnswerReply(int askNo) throws SQLException {
		int result = answerDao.deleteAnswerReply(askNo);
		if(result==0)throw new SQLException("삭제되지 않았습니다");
		
	}


	

}
