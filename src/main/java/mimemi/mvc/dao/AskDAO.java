package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.AnswerDTO;
import mimemi.mvc.dto.AskDTO;

public interface AskDAO {
	/**
	 * 1:1 문의 등록
	 * @param AskDTO(String userId, String askTitle, String askContent, String askAttach,
			String askCategory)
	 * */
	int insertAsk(AskDTO askDTO) throws SQLException;

	/**
	 * 1:1 문의 수정 
	 * @param AskDTO(int askNo, String userId, String askTitle, String askContent, 
			String askCategory)
	 * */
	int updateAsk(AskDTO askDTO) throws SQLException;
	
	/**
	 * 1:1 문의 게시글 첨부파일 수정
	 * @param: int askNo, String askAttach
	 * @return: int(수정 성공한 레코드 수)
	 * */
	int updateAskAttach(int askNo, String askAttach) throws SQLException;
	
	/**
	 * 1:1 문의 삭제
	 * @param int askNo
	 * */
	int deleteAsk(int askNo) throws SQLException;
	
	/**
	 * 1:1 문의 전체 검색
	 * */
	List<AskDTO> selectAllAsk(int pageNum, String field) throws SQLException;
	
	/**
	 * 1:1문의 상세보기
	 * */
	AskDTO selectByuserId(String userId)throws SQLException;
	
	/**
	 * 1:1 문의 전체 검색(페이지 처리)
	 * @param int pageNo
	 * */
	List<AskDTO> selectAllByPaging(int pageNo) throws SQLException;
	
	/**
	 * 문의 번호로 불러오기
	 * @param int askNo
	 * */
	AskDTO selectByAskNo(int askNo) throws SQLException;
	
	/**
	 * 1:1 문의 답변 여부 수정 기능
	 * */
	int updateState(int askNo, String state) throws SQLException;
	
	/**
	 * 문의에 대한 답변(댓글) 정보 가져오기
	 * @param int askNo
	 * @return List<AnswerDTO>
	 * */
	List<AnswerDTO> selectAnsByAskNo(int askNo) throws SQLException;
	
	
}
