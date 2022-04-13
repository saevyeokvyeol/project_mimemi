package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.FaqDTO;

public interface FAQBoardDAO {
	/**
	 * FAQ 등록
	 * @param FaqDTO(String faqTitle, String faqContent, String faqAttach)
	 * */
	int insertFaq(FaqDTO faqDTO) throws SQLException;
	
	/**
	 * FAQ 수정 
	 * @param FaqDTO(int faqNo, String faqTitle, String faqContent, String faqAttach, String faqModidate)
	 * */
	int updateFaq(FaqDTO faqDTO) throws SQLException;
	
	/**
	 * FAQ 이미지 수정
	 * @param int faqNo, String faqImg
	 * */
	int updateFaqImg(int faqNo, String faqImg) throws SQLException;
	
	/**
	 * FAQ 삭제 -> 입력값 없음
	 * */
	int deleteFaq(int faqNo) throws SQLException;

	/**
	 * FAQ 전체 검색
	 * */
	List<FaqDTO> selectAllFaq() throws SQLException;
	
	/**
	 * FAQ 전체 검색(페이지 처리)
	 * @param int pageNo
	 * */
	List<FaqDTO> getFaqList(int pageNo) throws SQLException;

	/**
	 * FAQ 키워드로 검색 (메소드 이름....)
	 * @param String faqKeyword
	 * */
	List<FaqDTO> getList(String faqKeyword) throws SQLException;
}
