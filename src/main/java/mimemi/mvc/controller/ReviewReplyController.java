package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.ReviewDTO;
import mimemi.mvc.dto.ReviewReplyDTO;
import mimemi.mvc.service.ReviewReplyService;
import mimemi.mvc.service.ReviewReplyServiceImpl;
import net.sf.json.JSONArray;

public class ReviewReplyController implements Controller {
	private ReviewReplyService replyService = new ReviewReplyServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 리뷰 상세보기: 댓글 조회하기
	 * */
	public void select(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String reviewNo = request.getParameter("reviewNo");
		
		List<ReviewReplyDTO> replyList = replyService.selectReplyByReviewNo(Integer.parseInt(reviewNo));		
		JSONArray replyArr = JSONArray.fromObject(replyList);
		PrintWriter out = response.getWriter();
		out.print(replyArr);
	}
	
	public void insert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String reviewNo = request.getParameter("reviewNo");
		String userId = request.getParameter("reply_id");
		String managerId = request.getParameter("reply_manager_id");
		String content=request.getParameter("reply_content");
		
		System.out.println("댓글다는 아이디: "+userId+","+managerId);
		ReviewReplyDTO reply = new ReviewReplyDTO(Integer.parseInt(reviewNo), userId, managerId, content);
		int result =replyService.insertReviewReply(reply);
		System.out.println(result);
		PrintWriter out= response.getWriter();
		out.print(result);
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String replyNo = request.getParameter("reply_No");
		System.out.println(replyNo);
		int result =replyService.deleteReviewReply(Integer.parseInt(replyNo));
		PrintWriter out = response.getWriter();
		out.print(result);
				
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String replyNo = request.getParameter("reply_No");
		String content = request.getParameter("reply_content");
	}
	

}
