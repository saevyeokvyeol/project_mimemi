package mimemi.mvc.service;

import java.sql.SQLException;

import mimemi.mvc.dto.AnswerDTO;

public interface AnswerService {
	/**
	 * ��� ���
	 * @param AnswerDTO(int askNo, String answerContent)
	 * */
	void insertAnswerReply(AnswerDTO answerDTO) throws SQLException;

	/**
	 * ��ۺ���
	 * */
	AnswerDTO selectByAskNo(int askNo)throws SQLException;
	
	/**
	 * ��� ���� 
	 * @param AnswerDTO(int answerNo, String answerContent)
	 * */
	void updateAnswerReply(AnswerDTO answerDTO) throws SQLException;
	
	/**
	 * ��� ����
	 * */
	void deleteAnswerReply(int askNo) throws SQLException;
	
}
