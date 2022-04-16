package mimemi.mvc.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dto.ReviewDTO;
import mimemi.mvc.service.ReviewService;
import mimemi.mvc.service.ReviewServiceImpl;

public class ReviewController implements Controller {
	private static ReviewService reviewService = new ReviewServiceImpl();
	
	public ReviewController() {}
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String curPageNo = request.getParameter("pageNo");
		if(curPageNo ==null||curPageNo.equals("")) {
			curPageNo="1";
		}
		String field =request.getParameter("field");
		if(field==null||field.equals("")) {
			field="reg";
		}
		
		System.out.println(field+" 페이지 번호: "+curPageNo);
		List<ReviewDTO> reviewList = reviewService.selectAllByPaging(Integer.parseInt(curPageNo), field);
		
		request.setAttribute("list", reviewList);
		request.setAttribute("pageNo", curPageNo);
		
		System.out.println("서비스에서 돌아온 후.."+curPageNo);
		
		return new ModelAndView("/board/reviewList.jsp");
		
	}
	public ModelAndView selectByKeyword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public ModelAndView selectByReviewNo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String curPageNo= request.getParameter("PageNo");
		
		ReviewDTO review = reviewService.selectByReviewNo(Integer.parseInt(request.getParameter("reviewNo")), true);
		request.setAttribute("pageNo", curPageNo);
		request.setAttribute("reviewDetail", review);
		return new ModelAndView("/board/reviewRead.jsp");
	}
	public ModelAndView updateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reviewNo= request.getParameter("reviewNo");
		ReviewDTO review = reviewService.selectByReviewNo(Integer.parseInt(reviewNo), false);
		request.setAttribute("review", review);
		return new ModelAndView("board/reviewUpdate.jsp");
	}
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getServletContext().getRealPath("/img/save");
		int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		System.out.println(saveDir);
		
		MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		
		String reviewTitle = m.getParameter("review_title");
		String reviewGoods = m.getParameter("review_select-goods");
		String reviewRate = m.getParameter("rate");
		String reviewContent =m.getParameter("review_contents");
		
		//HttpSession session = request.getSession();
		//String reviewUser = session.getAttribute("loginUser");
		String reviewUser = "happy01";
		
		System.out.println(reviewGoods);
		
		ReviewDTO review = new ReviewDTO(reviewUser,reviewGoods,reviewTitle,reviewContent,Integer.parseInt(reviewRate));
		
			if(m.getFilesystemName("review_image")!=null) {
				review.setReviewAttach(m.getFilesystemName("review_image"));
			}
		reviewService.insertReview(review);
		return new ModelAndView("front?key=review&methodName=selectAll",true);
	}
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public ModelAndView updateBlind(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}
