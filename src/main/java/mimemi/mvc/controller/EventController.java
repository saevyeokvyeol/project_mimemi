package mimemi.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dao.EventDAO;
import mimemi.mvc.dto.EventDTO;
import mimemi.mvc.dto.RgCouponDTO;
import mimemi.mvc.service.EventService;
import mimemi.mvc.service.EventServiceImpl;

public class EventController implements Controller {
	private EventService eventService = new EventServiceImpl();
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<EventDTO> eventList = eventService.selectAll();
		
		request.setAttribute("eventList", eventList);
		
		return new ModelAndView("board/eventAllList.jsp");
	}
	
}
