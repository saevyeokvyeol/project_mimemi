package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.NoticeDTO;

public interface NoticeDAO {
	/**
	 * 공지사항 등록
	 * @param NoticeDTO(String noticeTitle, String noticeContent, String noticeAttach)
	 * */
	int insertNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**
	 * 공지사항 수정 
	 * @param NoticeDTO(int noticeNo, String noticeTitle, String noticeContent)
	 * */
	int updateNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**
	 * 공지사항 이미지 수정
	 * @param int noticeNo, String noticeAttach
	 * */
	int updateNoticeAttach(int noticeNo, String noticeAttach) throws SQLException;
	
	/**
	 * 공지사항 삭제 
	 * */
	int deleteNotice(int noticeNo) throws SQLException;
	
	/**
	 * 공지사항 전체 검색
	 * */
	List<NoticeDTO> selectAllNotice(int pageNum, String field) throws SQLException;
	
	/**
	 * 공지사항 전체 검색(페이지 처리)
	 * */
	List<NoticeDTO> selectAllByPaging(int pageNo) throws SQLException;
	
	/**
	 * 공지사항 번호로 검색
	 * */
	NoticeDTO selectByNoticeNo(int noticeNo) throws SQLException;
	
	/**
	 * 공지사항 키워드 검색
 * 
	 * 제목과 내용에서 키워드 검색
	 * */
	List<NoticeDTO> selectByKeyword(String noticeKeyword, String field, int pageNo) throws SQLException;
	
	/**
	 * 고객(공지사항 키워드 검색)
 * 
	 * 제목과 내용에서 키워드 검색
	 * */
	List<NoticeDTO> selectByKeywordClient(String noticeKeyword, String field, int pageNo) throws SQLException;
	
	
	
}
