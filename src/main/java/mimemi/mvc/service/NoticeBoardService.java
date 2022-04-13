package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.NoticeDTO;

public interface NoticeBoardService {
	/**
	 * 공지사항 등록
	 * 
	 * */
	void insertNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**
	 * 공지사항 수정 
	 * */
	void updateNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**
	 * 공지사항 삭제 -> 입력값 없음(프론트단에서 처리)
	 * */
	void deleteNotice() throws SQLException;
	
	/**
	 * 공지사항 전체 검색
	 * */
	List<NoticeDTO> selectAllNotice() throws SQLException;
	
	/**
	 * 공지사항 전체 검색(페이지 처리)
	 * */
	List<NoticeDTO> getNoticeList(int pageNo) throws SQLException;
}
