package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.EventDTO;

public interface EventBoardService {
	/**
	 * 이벤트 등록
	 * @param EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach, String eventRegdate,
			String eventModidate, String eventStartdate, String eventEnddate)
	 * */
	void insertEvent(EventDTO eventDTO) throws SQLException;

	/**
	 * 이벤트 수정
	 * @param EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach, String eventRegdate,
			String eventModidate, String eventStartdate, String eventEnddate)
	 * */
	void updateEvent(EventDTO eventDTO) throws SQLException;

	/**
	 * 이벤트 삭제
	 * */
	void deleteEvent() throws SQLException;
	
	/**
	 * 이벤트 전체 검색
	 * */
	List<EventDTO> selectAllEvent() throws SQLException;

	/**
	 * 이벤트 전체 검색(페이지 처리)
	 * */
	List<EventDTO> getEventList(int pageNo) throws SQLException;

}
