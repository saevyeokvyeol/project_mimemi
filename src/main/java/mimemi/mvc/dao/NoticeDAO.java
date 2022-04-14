package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.NoticeDTO;

public interface NoticeDAO {
	/**
	 * �������� ���
	 * @param NoticeDTO(String noticeTitle, String noticeContent, String noticeAttach)
	 * */
	int insertNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**
	 * �������� ���� 
	 * @param NoticeDTO(int noticeNo, String noticeTitle, String noticeContent)
	 * */
	int updateNotice(NoticeDTO noticeDTO) throws SQLException;
	
	/**

	 * �������� �̹��� ����
	 * @param int noticeNo, String noticeAttach
	 * */
	int updateNoticeAttach(int noticeNo, String noticeAttach) throws SQLException;
	
	/**
	 * �������� ���� 
	 * */
	int deleteNotice(int noticeNo) throws SQLException;
	
	/**
	 * �������� ��ü �˻�
	 * */
	List<NoticeDTO> selectAllNotice() throws SQLException;
	
	/**
	 * �������� ��ü �˻�(������ ó��)
	 * */
	List<NoticeDTO> selectAllByPaging(int pageNo) throws SQLException;
	
	/**
	 * �������� ��ȣ�� �˻�
	 * */
	NoticeDTO selectByNoticeNo(int noticeNo) throws SQLException;
	
	/**
	 * �������� Ű���� �˻�
	 * @param String noticeKeyword
	 * 
	 * ����� ���뿡�� Ű���� �˻�
	 * */
	List<NoticeDTO> selectByKeyword(String noticeKeyword, String field) throws SQLException;
}