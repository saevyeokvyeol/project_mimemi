package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.NoticeDTO;

public interface NoticeService {
	/**
	 * 공지사항 등록
	 * @param NoticeDTO(String noticeTitle, String noticeContent, String noticeAttach)
	 * */
	void insertNotice(NoticeDTO noticeDTO, String path) throws SQLException;
	
	/**
	 * 공지사항 수정 
	 * @param NoticeDTO(int noticeNo, String noticeTitle, String noticeContent)
	 * */
	void updateNotice(NoticeDTO noticeDTO, String path) throws SQLException;
	
	/**

	 * 공지사항 이미지 수정
	 * @param int noticeNo, String noticeAttach
	 * */
	void updateNoticeAttach(int noticeNo, String noticeAttach) throws SQLException;
	
	/**
	 * 공지사항 삭제 
	 * */
	void deleteNotice(NoticeDTO notice, String path) throws SQLException;
	
	/**
	 * 공지사항 전체 검색
	 * */
    List<NoticeDTO> selectAllNotice(int pageNum, String filed) throws SQLException;
	
	
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
	 * @param String noticeKeyword
	 * 
	 * 제목과 내용에서 키워드 검색
	 * */
	List<NoticeDTO> selectByKeyword(String noticeKeyword, String field) throws SQLException;
}
