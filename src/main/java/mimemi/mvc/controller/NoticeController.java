package mimemi.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dto.NoticeDTO;
import mimemi.mvc.dto.OrderDTO;
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
	 **/
	public ModelAndView insertNotice(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String saveDir = request.getServletContext().getRealPath("/img");
		int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		System.out.println(saveDir);
		
		MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		
		System.out.println("아마2");

		String noticeTitle = m.getParameter("notice_title"); 
		String noticeContent = m.getParameter("notice_content"); 
		String noticeAttach = m.getParameter("notice_attach"); 

		
		NoticeDTO noticeDto = new NoticeDTO(noticeTitle, noticeContent, noticeAttach);
		System.out.println("아마");
		
		if(m.getFilesystemName("noticeAttach") != null) {
			noticeDto. setNoticeAttach(m.getFilesystemName("noticeAttach"));	
		}	
		noticeService.insertNotice(noticeDto);
		
		
		return new ModelAndView("front?key=notice&methodName=selectAllNotice", true);
		
		
	}

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
	
	/**
	 *  공지사항 관리자 전체보기
	 **/
	
	public ModelAndView selectAllNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8"); 
        
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		String field = request.getParameter("field");
		
		List<NoticeDTO> noticeList = noticeService.selectAllNotice(Integer.parseInt(pageNum), field);
		
		request.setAttribute("NoticeList", noticeList);
		request.setAttribute("pageNum", pageNum); 
		ModelAndView mv = new ModelAndView("manager/selectNoticeAll.jsp");
		
		return mv;
	}
	
		
	/**
	 *  공지사항 고객 전체보기
	 **/
	
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8"); 
        
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		String field = request.getParameter("field");
		
		List<NoticeDTO> noticeList = noticeService.selectAllNotice(Integer.parseInt(pageNum), field);
		
		request.setAttribute("NoticeList", noticeList);
		request.setAttribute("pageNum", pageNum); 
		ModelAndView mv = new ModelAndView("board/notice.jsp");
		
		return mv;
	}	
	
	
	
	
	
	
	/**
	 *  상세보기 
	 **/
	
	/**
	 * 수정폼 
	 **/
	public ModelAndView updateFrom(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String noticeNo = request.getParameter("noticeNo");
		NoticeDTO notice = noticeService.selectByNoticeNo(Integer.parseInt(noticeNo));
		request.setAttribute("notice", notice);
		return new ModelAndView("");
	}
	
	
	/**
	 * 수정하기
	 **/

	
	
	
	/**
	 * 삭제하기
	 **/
	
}