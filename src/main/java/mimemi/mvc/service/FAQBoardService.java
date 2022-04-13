package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.FaqDTO;

public interface FAQBoardService {
	/**
	 * FAQ 등록
	 * */
	void insertFaq(FaqDTO faqDTO) throws SQLException;
	/**
	 * FAQ 수정 
	 * */
	void updateFaq(FaqDTO faqDTO) throws SQLException;
	/**
	 * FAQ 삭제 -> 입력값 없음
	 * */
	void deleteFaq() throws SQLException;

	/**
	 * FAQ 전체 검색
	 * */
	List<FaqDTO> selectAllFaq() throws SQLException;
	/**
	 * FAQ 전체 검색(페이지 처리)
	 * */
	List<FaqDTO> getFaqList(int pageNo) throws SQLException;

}
