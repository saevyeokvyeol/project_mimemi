package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.AskDTO;

public interface AskBoardDAO {
	/**
	 * 1:1 문의 등록
	 * */
	int insertAsk(AskDTO askDTO) throws SQLException;

	/**
	 * 1:1 문의 수정 
	 * */
	int updateAsk(AskDTO askDTO) throws SQLException;
	/**
	 * 1:1 문의 삭제
	 * */
	int deleteAsk(String askPwd) throws SQLException;
	/**
	 * 1:1 문의 전체 검색
	 * */
	List<AskDTO> selectAllAsk() throws SQLException;
	/**
	 * 1:1 문의 전체 검색(페이지 처리)
	 * */
	List<AskDTO> getAskList(int pageNo) throws SQLException;
	
}
