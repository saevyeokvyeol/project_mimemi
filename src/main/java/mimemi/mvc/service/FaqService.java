package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.FaqDTO;

public interface FaqService {
	/**
	 * FAQ 등록
	 * @param FaqDTO(String faqTitle, String faqContent, String faqAttach)
	 * */
	void insertFaq(FaqDTO faqDTO, String path) throws SQLException;
	
	/**
	 * FAQ 수정 
	 * @param FaqDTO(int faqNo, String faqTitle, String faqContent)
	 * 수정날짜는 자동으로 sysdate
	 * */
	void updateFaq(FaqDTO faqDTO, String path) throws SQLException;
	
	/**
	 * FAQ 이미지 수정
	 * @param int faqNo, String faqAttach
	 * */
	void updateFaqImg(int faqNo, String faqAttach) throws SQLException;
	
	/**
	 * FAQ 삭제
	 * @param int faqNo
	 * 삭제하면 완전히 삭제
	 * */
	void deleteFaq(FaqDTO faq, String path) throws SQLException;

	/**
	 * FAQ 전체 검색
	 * */
	List<FaqDTO> selectAllFaq(int pageNum, String filed) throws SQLException;
	
	/**
	 * FAQ 전체 검색(페이지 처리)
	 * @param int pageNo
	 * */
	List<FaqDTO> selectAllByPaging(int pageNo) throws SQLException;

	/**
	 * FAQ 키워드로 검색
	 * @param String faqKeyword
	 * 
	 * 제목과 내용에서 검색한다.
	 * */
	List<FaqDTO> selectByKeyword(String faqKeyword, String field) throws SQLException;
	
	/**
	 * FAQ 번호로 검색
	 * @param int faqNo
	 * */
	FaqDTO selectByFaqNo(int faqNo) throws SQLException;
	
	/**
	 * FAQ 카테고리별 검색 (카테고리)
	 * @param String faqCategory
	 * 
	 * 카테고리별로 리스트를 나눈다.(주문/결제/상품 등등)
	 * */
	List<FaqDTO> selectByCtg(String faqCategory) throws SQLException;

}
