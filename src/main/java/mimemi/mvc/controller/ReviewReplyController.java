package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("replyselect ~~~");
		String reviewNo = request.getParameter("reviewNo");
		List<ReviewReplyDTO> replyList = replyService.selectReplyByReviewNo(Integer.parseInt(reviewNo));
		
		JSONArray replyArr = JSONArray.fromObject(replyList);
		PrintWriter out = response.getWriter();
		out.print(replyArr);
	}
	

}
