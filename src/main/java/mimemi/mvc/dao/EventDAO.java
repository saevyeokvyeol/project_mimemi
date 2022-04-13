package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.EventDTO;

public interface EventDAO {
	/**
	 * 이벤트 게시글 등록
	 * @param: EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach,
	 * 			String eventStartdate, String eventEnddate)
	 * @return: int(등록 성공한 레코드 수)
	 * */
	int insert(EventDTO event) throws SQLException;
	
	/**
	 * 이벤트 게시글 수정
	 * @param: EventDTO(int eventId, String eventTitle, String eventContent, String eventStartdate,
	 * 			String eventEnddate)
	 * 			게시글 제목과 내용, 시작일과 종료일만 변경
	 * @return: int(수정 성공한 레코드 수)
	 * */
	int updateEvent(EventDTO event) throws SQLException;
	
	/**
	 * 이벤트 게시글 썸네일 이미지 수정
	 * @param: EventDTO(int eventId, String eventThumbnail)
	 * @return: int(수정 성공한 레코드 수)
	 * */
	int updateThumbnail(int eventId, String eventThumbnail) throws SQLException;
	
	/**
	 * 이벤트 게시글 상세 이미지 수정
	 * @param: EventDTO(int eventId, String eventAttach)
	 * @return: int(수정 성공한 레코드 수)
	 * */
	int updateEventAttach(int eventId, String eventAttach) throws SQLException;
	
	/**
	 * 이벤트 게시글 전체 조회
	 * @return: List<EventDTO>
	 * */
	List<EventDTO> selectAll() throws SQLException;
	
	/**
	 * 이벤트 게시글 진행 상황별 조회
	 * sysdate를 기준으로 진행 예정/ 진행중 / 진행 완료를 나누어 조회
	 * @param: String state(진행 예정, 진행중, 진행 완료에 따라 쿼리문 변경)
	 * @return: List<EventDTO>
	 * */
	List<EventDTO> selectByDate(String state) throws SQLException;
	
	/**
	 * 이벤트 게시글 키워드 조회
	 * 제목에 키워드가 있는 게시글만 조회
	 * @param: String keyword
	 * @return: List<EventDTO>
	 * */
	List<EventDTO> selectByKeyword(String keyword) throws SQLException;
	
	/**
	 * 이벤트 게시글 상세 조회
	 * 글번호 기준으로 게시글 상세 조회
	 * @param: int eventNo
	 * @return: EventDTO
	 * */
	EventDTO selectByEventNo(int eventNo) throws SQLException;
	
}
