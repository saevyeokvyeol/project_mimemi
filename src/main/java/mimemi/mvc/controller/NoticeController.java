package mimemi.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dto.NoticeDTO;
import mimemi.mvc.service.NoticeService;
import mimemi.mvc.service.NoticeServiceImpl;

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
	
		
		
	}
	
	/**
	 *  전체검색하기
	 **/
	
	
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
