package mimemi.mvc.service;

import java.sql.SQLException;

import mimemi.mvc.dto.AnswerDTO;

public interface AnswerService {
	/**
	 * ´ñ±Û µî·Ï
	 * @param AnswerDTO(int askNo, String answerContent)
	 * */
	void insertAnswerReply(AnswerDTO answerDTO) throws SQLException;

	/**
	 * ´ñ±Ûº¸±â
	 * */
	AnswerDTO selectByAskNo(int askNo)throws SQLException;
	
	/**
	 * ´ñ±Û ¼öÁ¤ 
	 * @param AnswerDTO(int answerNo, String answerContent)
	 * */
	void updateAnswerReply(AnswerDTO answerDTO) throws SQLException;
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	void deleteAnswerReply(int askNo) throws SQLException;
	
}
