package mimemi.mvc.dao;

import java.sql.SQLException;

import mimemi.mvc.dto.AnswerDTO;

public interface AnswerBoardDAO {
	/**
	 * ´ñ±Û µî·Ï
	 * @param AnswerDTO(int askNo, String answerContent)
	 * */
	int insertAnswerReply(AnswerDTO answerDTO) throws SQLException;

	/**
	 * ´ñ±Û ¼öÁ¤ 
	 * @param AnswerDTO(int answerNo, String answerContent)
	 * */
	int updateAnswerReply(AnswerDTO answerDTO) throws SQLException;
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	int deleteAnswerReply(int answerNo) throws SQLException;
	
}
