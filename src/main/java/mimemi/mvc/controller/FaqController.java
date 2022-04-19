package mimemi.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dto.FaqDTO;
import mimemi.mvc.dto.NoticeDTO;
import mimemi.mvc.service.FaqService;
import mimemi.mvc.service.FaqServiceImpl;

public class FaqController implements Controller {
	private FaqService faqService = new FaqServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 *  FAQ 등록
	 **/
     public ModelAndView insertFaq(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	 response.setContentType("text/html;charset=UTF-8"); 
    	 
    		String saveDir = request.getServletContext().getRealPath("/img");
    		int maxSize = 1024*1024*100;
    		String encoding= "UTF-8";
    		System.out.println(saveDir);
    	 
    		MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
    		
    		String faqTitle = m.getParameter("faq_title");
    		String faqContent = m.getParameter("faq_content");
    		String faqCategory = m.getParameter("faq_category");
    		
    		FaqDTO faqDto = new FaqDTO(faqTitle, faqContent, faqCategory);
    		
    		if(m.getFilesystemName("faqAttach") != null) {
    			faqDto. setFaqAttach(m.getFilesystemName("faqAttach"));	
    		}	
    		faqService.insertFaq(faqDto, saveDir);
    		
    		
    		return new ModelAndView("front?key=faq&methodName=selectAllFaq", true);
    		
    		
    	}
    		
    	
	
	
	
	
	
	/**
	 *  FAQ 전체보기 
	 **/
     
	public ModelAndView selectAllFaq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); 
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
        String field = request.getParameter("field");
		
		List<FaqDTO> faqList = faqService.selectAllFaq(Integer.parseInt(pageNum), field);
		
		request.setAttribute("FaqList", faqList);
		request.setAttribute("pageNum", pageNum); 
		ModelAndView mv = new ModelAndView("manager/selectFaqAll.jsp");
		
		return mv;
	}
	

	/**
	 *  FAQ 고객뷰어 
	 **/
		
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8"); 
        
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		String field = request.getParameter("field");
		
		List<FaqDTO> faqList = faqService.selectAllFaq(Integer.parseInt(pageNum), field);
		
		request.setAttribute("FaqList", faqList);
		request.setAttribute("pageNum", pageNum); 
		ModelAndView mv = new ModelAndView("board/faq.jsp");
		
		return mv;
	}	
	
	
	
	
	
	
	/**
	 *  상세보기 
	 **/
	
	public ModelAndView selectByFaqNo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8"); 
        
        String faqNo = request.getParameter("faqNo");

	/*	String user = request.getParameter("user");
		
		boolean isAdmin = (user.equals("admin")) ? true : false;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}*/

	    FaqDTO faq = faqService.selectByFaqNo(Integer.parseInt(faqNo));
		request.setAttribute("faq", faq); 
		
		/*request.setAttribute("isAdmin", isAdmin);*/
		return new ModelAndView("/board/faq.jsp"); 
		
	
	}
	

	/**
	 * FAQ 수정페이지로 이동 
	 **/
	public ModelAndView updateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String faqNo = request.getParameter("faqNo");
		FaqDTO faq = faqService.selectByFaqNo(Integer.parseInt(faqNo));
		request.setAttribute("faq", faq);
		return new ModelAndView("manager/faqUpdate.jsp");
	}
	
	/**
	 * FAQ 수정하기
	 **/
     public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String saveDir = request.getServletContext().getRealPath("/img");
    	int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		System.out.println(saveDir);
    	
        MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		
		String faqNo= m.getParameter("faqNo");
		String faqCategory=m.getParameter("faq_category");
		String faqTitle = m.getParameter("faq_title");
		String faqContent = m.getParameter("faq_content");
         
		System.out.println("수정하는 FAQ번호: "+faqNo+ "FAQ제목: "+faqTitle +"FAQ카테고리" +faqCategory);
		
		FaqDTO faq = new FaqDTO(Integer.parseInt(faqNo), faqTitle, faqContent, faqCategory);
		
		if(m.getFilesystemName("faq_attach")!=null) {
			
			String faqAttach =m.getFilesystemName("faq_attach");
			//파일 이름을 reviewDTO에 저장한다.
			faq.setFaqAttach(faqAttach);
			//데이터베이스에 이미지와 함께 수정한다.
			//connection을 유지하기 위해 reviewService.updateFaqImg 작성안했다. 
			//나중에 필요하면 만들기
			//reviewService.updateFaqImg(Integer.parseInt(reviewNo), reviewAttach);
			System.out.println("수정하려는 첨부파일이름: "+faqAttach);
		}
	//나머지 입력값을 수정한다.
	//saveDir: 오류를 대비해서 첨부파일을 삭제할 save 경로도 보낸다.
	faqService.updateFaq(faq,saveDir);
		
	return new ModelAndView("front?key=faq&methodName=selectAllFaq",true);
	
	
}

 	/**
 	 * FAQ 삭제하기
 	 **/
 	
      
      public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
  		String faqNo = request.getParameter("faqNo");
  		FaqDTO faq = faqService.selectByFaqNo(Integer.parseInt(faqNo));
  		 
  		//삭제할 경로
  		String path =request.getServletContext().getRealPath("/img/");
  		//첨부파일 이름
  		System.out.println("삭제할 후기 게시물 번호: "+faq.getFaqNo());
  		faqService.deleteFaq(faq,path);
 		
 		//삭제를 마치면 게시물 list로 돌아간다.
 		return new ModelAndView("front?key=faq&methodName=selectAllFaq",true);
 	}
	
	
     
     
     
     
		
}
	
	
	
	
	
