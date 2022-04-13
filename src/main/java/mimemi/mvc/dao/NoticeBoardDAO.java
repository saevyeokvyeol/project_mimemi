package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.NoticeDTO;

public interface NoticeBoardDAO {
	/**
	 * 공지사항 등록
	 * */
	int insertNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**
	 * 공지사항 수정 
	 * */
	int updateNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**
	 * 공지사항 삭제 -> 입력값 없음(프론트단에서 처리)
	 * */
	int deleteNotice() throws SQLException;
	/**
	 * 공지사항 전체 검색
	 * */
	List<NoticeDTO> selectAllNotice() throws SQLException;
	
	/**
	 * 공지사항 전체 검색(페이지 처리)
	 * */
	List<NoticeDTO> getNoticeList(int pageNo) throws SQLException;

}
