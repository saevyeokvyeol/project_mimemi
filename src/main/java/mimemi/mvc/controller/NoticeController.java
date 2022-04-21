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
		
		String noticeTitle = m.getParameter("notice_title"); 
		String noticeContent = m.getParameter("notice_content"); 
		String noticeAttach = m.getFilesystemName("notice_attach"); 
        
		NoticeDTO noticeDto = new NoticeDTO(noticeTitle, noticeContent, noticeAttach);

		
		if(m.getFilesystemName("noticeAttach") != null) {
			noticeDto.setNoticeAttach(m.getFilesystemName("noticeAttach"));	
		}	
		
		noticeService.insertNotice(noticeDto,saveDir);
		
		
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
		ModelAndView mv = new ModelAndView("manager/notice_Main_Mg.jsp");
		
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
	
	public ModelAndView selectByNoticeNo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8"); 
        
        String noticeNo = request.getParameter("noticeNo");

	/*	String user = request.getParameter("user");
		
		boolean isAdmin = (user.equals("admin")) ? true : false;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}*/

	    NoticeDTO notice = noticeService.selectByNoticeNo(Integer.parseInt(noticeNo));
		request.setAttribute("noticeDetail", notice); 
		
		/*request.setAttribute("isAdmin", isAdmin);*/
		return new ModelAndView("/board/notice_view.jsp"); 
		
	
	}
	
	
	
	
	/**
	 * 공지사항 수정페이지로 이동 
	 **/
	public ModelAndView updateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String noticeNo = request.getParameter("noticeNo");
		NoticeDTO notice = noticeService.selectByNoticeNo(Integer.parseInt(noticeNo));
		request.setAttribute("notice", notice);
		return new ModelAndView("manager/notice_Update.jsp");
	}
	
	/**
	 * 공지사항 수정하기
	 **/
     public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String saveDir = request.getServletContext().getRealPath("/img");
    	int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		System.out.println(saveDir);
    	
        MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		
		String noticeNo= m.getParameter("noticeNo");
		String noticeTitle = m.getParameter("notice_title");
		String noticeContent = m.getParameter("notice_content");
         
		System.out.println("수정하는 공지사항번호: "+noticeNo+"공지제목: "+noticeTitle);
		
		NoticeDTO notice = new NoticeDTO(Integer.parseInt(noticeNo),noticeTitle,noticeContent);
		
		if(m.getFilesystemName("notice_attach")!=null) {
			
			String noticeAttach =m.getFilesystemName("notice_attach");
			//파일 이름을 reviewDTO에 저장한다.
			notice.setNoticeAttach(noticeAttach);
			//데이터베이스에 이미지와 함께 수정한다.
			//connection을 유지하기 위해 reviewService.updateFaqImg 작성안했다. 
			//나중에 필요하면 만들기
			//reviewService.updateFaqImg(Integer.parseInt(reviewNo), reviewAttach);
			System.out.println("수정하려는 첨부파일이름: "+noticeAttach);
		}
	//나머지 입력값을 수정한다.
	//saveDir: 오류를 대비해서 첨부파일을 삭제할 save 경로도 보낸다.
	noticeService.updateNotice(notice,saveDir);
		
	return new ModelAndView("front?key=notice&methodName=selectAllNotice",true);
	
	
}
	
	
	/**
	 * 공지사항 삭제하기
	 **/
	
     
     public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		String noticeNo = request.getParameter("noticeNo");
 		NoticeDTO notcie = noticeService.selectByNoticeNo(Integer.parseInt(noticeNo));
 		
 		//삭제할 경로
 		String path =request.getServletContext().getRealPath("/img/");
 		//첨부파일 이름
 		System.out.println("삭제할 후기 게시물 번호: "+notcie.getNoticeNo());
 		noticeService.deleteNotice(notcie,path);
		
		//삭제를 마치면 게시물 list로 돌아간다.
		return new ModelAndView("front?key=notice&methodName=selectAllNotice",true);
	}
	
    /**
     *  검색기능  
     **/
     
     public ModelAndView selectByKeyword(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		response.setContentType("text/html;charset=UTF-8");
 		String curPageNo = request.getParameter("pageNum");
 		if(curPageNo ==null||curPageNo.equals("")) {
 			curPageNo="1";
 		}
     
 		String field= request.getParameter("field");
		String keyword= request.getParameter("keyword");
		List<NoticeDTO> noticeList=noticeService.selectByKeyword(keyword, field, Integer.parseInt(curPageNo));
         
		
		
		request.setAttribute("list", noticeList);
		request.setAttribute("pageNum", curPageNo);
		request.setAttribute("field", field);
		request.setAttribute("keyword", keyword);
		System.out.println(keyword+" = 페이지번호: "+curPageNo);
		return new ModelAndView("/manager/notice_Search_Mg.jsp");
	}
     
     /**
      *  (고객)검색기능  
      **/
      
     
     public ModelAndView selectByKeywordClient(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		response.setContentType("text/html;charset=UTF-8");
 		String curPageNo = request.getParameter("pageNum");
 		if(curPageNo ==null||curPageNo.equals("")) {
 			curPageNo="1";
 		}
     
 		String field= request.getParameter("field");
		String keyword= request.getParameter("keyword");
		List<NoticeDTO> noticeList=noticeService.selectByKeywordClient(keyword, field, Integer.parseInt(curPageNo));
         
		
		
		request.setAttribute("list", noticeList);
		request.setAttribute("pageNum", curPageNo);
		request.setAttribute("field", field);
		request.setAttribute("keyword", keyword);
		System.out.println(keyword+" = 페이지번호: "+curPageNo);
		return new ModelAndView("/board/noticeSearchCl.jsp");
	}
     
     
     
     
     
     
     
}