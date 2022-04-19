package mimemi.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dto.AnswerDTO;
import mimemi.mvc.service.AnswerService;
import mimemi.mvc.service.AnswerServiceImpl;

public class AnswerController implements Controller {

	private AnswerService answerService = new AnswerServiceImpl();
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
	/**
	 * ´ñ±Û µî·Ï
	 * */
	public ModelAndView insertAnswerReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getServletContext().getRealPath("/save");
		int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		response.setContentType("text/html;charset=UTF-8"); 
		
		MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		String askNo = m.getParameter("askNo");
		String answerContent=m.getParameter("answer_content");
		
		AnswerDTO answerDto= new AnswerDTO(Integer.parseInt(askNo), answerContent);
		
		answerService.insertAnswerReply(answerDto);
		
		return new ModelAndView("front?key=ask&methodName=selectAll", true);
	}
	
	/**
	 * ´ñ±Ûº¸±â (È¸¿ø)
	 * */
	public ModelAndView selectAnswerReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); 
		
		String askNo=request.getParameter("askNo");
		
		AnswerDTO answerDto = answerService.selectByAskNo(Integer.parseInt(askNo));
		request.setAttribute("answerDto", answerDto);
		
		return new ModelAndView("/board/askupdate.jsp");
	}
	
	/**
	 * ´ñ±Û ¼öÁ¤
	 * */
	public ModelAndView updateAnswerReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
	/**
	 * ´ñ±Û »èÁ¦
	 * */
	
	public ModelAndView deleteAnswerReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
}
