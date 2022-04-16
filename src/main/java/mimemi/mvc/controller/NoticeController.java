package mimemi.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.NoticeDTO;
import mimemi.mvc.dto.ReviewDTO;
import mimemi.mvc.service.NoticeService;
import mimemi.mvc.service.NoticeServiceImpl;
import net.sf.json.JSONArray;

public class NoticeController implements Controller {
    private NoticeService noticeService = new NoticeServiceImpl(); 
    
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 공지사항 등록
	 * @throws SQLException 
	 **/
  /*  
	public void insertNotice(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String saveDir=request.getServletContext().getRealPath("/save");
		int maxSize =1024*1024*100;
	    String encoding="UTF-8";
	    
		MultipartRequest m = 
				new MultipartRequest(request, saveDir,maxSize,encoding , new DefaultFileRenamePolicy());
	    

		String noticeTitle = m.getParameter("notice_title"); 
		String noticeContent = m.getParameter("notice_cotent"); 
		String noticeAttach = m.getParameter("notice_attach"); 
		
		NoticeDTO noticeDto = new NoticeDTO(maxSize, noticeTitle, noticeContent, noticeAttach, noticeAttach);
		if(m.getFilesystemName("noticeAttach") != null) {
			noticeDto. setNoticeAttach(m.getFilesystemName("noticeAttach"));	
		}	
		noticeService.insertNotice(noticeDto);	
		return new ModelAndView("front", true);
	
		
		
	
	
*/

/*	
	public ModelAndView selectAllNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String curPageNo = request.getParameter("pageNo");
		if(curPageNo ==null||curPageNo.equals("")) {
			curPageNo="1";
		}
		String field =request.getParameter("field");
		if(field==null||field.equals("")) {
			field="reg";
		}
		
		System.out.println(field+" 페이지 번호: "+curPageNo);
		List<NoticeDTO> noticeList = noticeService.selectAllNotice();
		
		request.setAttribute("list", noticeList);
		request.setAttribute("pageNo", curPageNo);
		
		System.out.println("서비스에서 돌아온 후.."+curPageNo);
		
		return new ModelAndView("/board/reviewList.jsp");
		
	}
	
	*/
	
	public void selectAllNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8"); 
        
        List<NoticeDTO> list = noticeService.selectAllNotice();
        
        JSONArray noticeArr = JSONArray.fromObject(list);
        
        PrintWriter out = response.getWriter();
        out.print(noticeArr);
        
		
		
		
	}
	
	
	
	
	
	
	
	
	/**
	 *  상세보기 
	 **/
	
	/**
	 * 수정폼 
	 **/
	
	/**
	 * 수정하기
	 **/
	
	/**
	 * 삭제하기
	 **/
	}
