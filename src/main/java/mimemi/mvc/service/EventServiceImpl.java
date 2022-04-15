package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.EventDTO;

public class EventServiceImpl implements EventService {

	/**
	 * 이벤트 게시글 등록
	 * @param: EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach, String eventImg,
	 * 			String eventStartdate, String eventEnddate)
	 * */
	@Override
	public void insert(EventDTO event) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateEvent(EventDTO event) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateEventImg(int eventId, String eventImg) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateEventAttach(int eventId, String eventAttach) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<EventDTO> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventDTO> selectByDate(String state) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EventDTO selectByEventNo(int eventNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventDTO> getEventList(int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
