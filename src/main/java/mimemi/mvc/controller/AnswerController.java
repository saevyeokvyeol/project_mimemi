package mimemi.mvc.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dto.AnswerDTO;
import mimemi.mvc.service.AnswerService;
import mimemi.mvc.service.AnswerServiceImpl;
import net.sf.json.JSONArray;

public class AnswerController implements Controller {

	private AnswerService answerService = new AnswerServiceImpl();
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
	/**
	 * 댓글 등록
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
		
		return new ModelAndView("/manager/ask_Main_Mg.jsp");
	}
	
	/**
	 * 댓글보기 (회원)
	 * */
	public void selectAnswerReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); 
		
		String askNo=request.getParameter("askNo");
		System.out.println("controller");
		AnswerDTO answerDto = answerService.selectByAskNo(Integer.parseInt(askNo));
		request.setAttribute("answerDto", answerDto);
		
		JSONArray replyArr = JSONArray.fromObject(answerDto);
		PrintWriter out = response.getWriter();
		out.print(replyArr);
		
	}
	
	/**
	 * 댓글보기 (관리자)
	 * */
	public void selectAnswerReplyManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); 
		
		String askNo=request.getParameter("askNo");
		System.out.println("controller");
		AnswerDTO answerDto = answerService.selectByAskNo(Integer.parseInt(askNo));
		request.setAttribute("answerDto", answerDto);
		
		JSONArray replyArr = JSONArray.fromObject(answerDto);
		PrintWriter out = response.getWriter();
		out.print(replyArr);
		
	}
	
	/**
	 * 수정페이지이동
	 * */
	public ModelAndView updateAnswerReplyForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String askNo=request.getParameter("askNo");
		AnswerDTO answerDto=answerService.selectByAskNo(Integer.parseInt(askNo));
		request.setAttribute("answerDto", answerDto);
		
		return new ModelAndView("/manager/ask_Answer.jsp");
	}
	
	/**
	 * 댓글 수정
	 * */
	public ModelAndView updateAnswerReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String askNo=request.getParameter("askNo");
		String answerContent=request.getParameter("answerContent");
		
		AnswerDTO answerDto = new AnswerDTO(Integer.parseInt(askNo), answerContent);
	
		answerService.updateAnswerReply(answerDto);
		
		return new ModelAndView("/manager/ask_Main_Mg.jsp");
	}
	
	/**
	 * 댓글 삭제
	 * */
	
	public ModelAndView deleteAnswerReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String askNo=request.getParameter("askNo");
		answerService.deleteAnswerReply(Integer.parseInt(askNo));
		
		
		return new ModelAndView("/manager/ask_Main_Mg.jsp");
	}
	
}
