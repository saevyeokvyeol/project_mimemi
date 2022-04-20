package mimemi.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dao.EventDAO;
import mimemi.mvc.dto.EventDTO;
import mimemi.mvc.dto.ReviewDTO;
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
		String curPageNo = request.getParameter("pageNum");
		if(curPageNo ==null||curPageNo.equals("")) {
			curPageNo="1";
		}
		String field =request.getParameter("field");
		if(field==null||field.equals("")) {
			field="reg";
		}
		
		System.out.println(field+" 페이지 번호: "+curPageNo);
		
		List<EventDTO> eventList = eventService.selectAll(field, Integer.parseInt(curPageNo));
		
		request.setAttribute("eventList", eventList);
		request.setAttribute("pageNum", curPageNo);
		request.setAttribute("field", field);
		
		return new ModelAndView("board/eventAllList.jsp");
	}
	
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getServletContext().getRealPath("/img/save");
		int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		//System.out.println(saveDir);
		
		MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		
		String eventTitle = m.getParameter("eventTitle");
		String eventContent = m.getParameter("eventContent");
		String eventStartdate = m.getParameter("eventStartdate");
		String eventEnddate =m.getParameter("eventEnddate");

		
		System.out.println("이벤트등록하려는 제목: "+ eventTitle);
		
		EventDTO event = new EventDTO(eventTitle, eventContent, eventStartdate, eventEnddate);
		
			//파일 첨부 했다면(필수요소가 아니기때문에 생성자에 없으므로 추가해준다)
			if(m.getFilesystemName("eventAttach")!=null) {
				
				//파일이름 저장한다.
				event.setEventAttach(m.getFilesystemName("eventAttach"));
				
			}
			
			if(m.getFilesystemName("eventImg")!=null) {
				//파일이름 저장한다.
				event.setEventImg(m.getFilesystemName("eventImg"));
			}
			
		//saveDir: 오류를 대비해서 첨부파일을 삭제할 save 경로도 보낸다.
		eventService.insert(event,saveDir);
		return new ModelAndView("front?key=event&methodName=selectAll",true);
	}
	
}
