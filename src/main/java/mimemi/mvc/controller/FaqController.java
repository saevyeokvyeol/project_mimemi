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
    		System.out.println(faqCategory);
    		FaqDTO faqDto = new FaqDTO(faqTitle, faqContent, faqCategory);
    		
    		if(m.getFilesystemName("faqAttach") != null) {
    			faqDto. setFaqAttach(m.getFilesystemName("faqAttach"));	
    		}	
    		faqService.insertFaq(faqDto);
    		
    		
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
		
		
}
	
	
	
	
	
