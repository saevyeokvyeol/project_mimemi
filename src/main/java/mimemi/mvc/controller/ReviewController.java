package mimemi.mvc.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mimemi.mvc.dto.ReviewDTO;
import mimemi.mvc.dto.ReviewReplyDTO;
import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.service.ReviewService;
import mimemi.mvc.service.ReviewServiceImpl;
import net.sf.json.JSONArray;

public class ReviewController implements Controller {
	private static ReviewService reviewService = new ReviewServiceImpl();
	
	public ReviewController() {}
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
	/**
	 * 사용자/회원 - 리뷰 전체 조회하기(+페이지처리)
	 * */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String curPageNo = request.getParameter("pageNum");
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
		request.setAttribute("pageNum", curPageNo);
		request.setAttribute("field", field);
		
		//System.out.println("서비스에서 돌아온 후.."+curPageNo);
		
		return new ModelAndView("/board/reviewList.jsp");
		
	}
	
	/**
	 * 검색기능
	 * */
	public ModelAndView selectByKeyword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String curPageNo = request.getParameter("pageNum");
		if(curPageNo ==null||curPageNo.equals("")) {
			curPageNo="1";
		}
		
		String field= request.getParameter("field");
		String keyword= request.getParameter("keyword");
		List<ReviewDTO> reviewList=reviewService.selectByKeyword(keyword, field, Integer.parseInt(curPageNo));
		//System.out.println("개수 : " + reviewList.size());
		request.setAttribute("list", reviewList);
		request.setAttribute("pageNum", curPageNo);
		request.setAttribute("field", field);
		request.setAttribute("keyword", keyword);
		System.out.println(keyword+" = 페이지번호: "+curPageNo);
		return new ModelAndView("/board/reviewSearch.jsp");
	}
	//http://localhost:8000/mimemi/front?key=review&methodName=selectByKeyword&pageNum=2&field=title&keyword=%EB%A7%9B
	/**
	 * 리뷰 상세보기
	 * */
	public ModelAndView selectByReviewNo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String curPageNo= request.getParameter("pageNum");
		
		ReviewDTO review = reviewService.selectByReviewNo(Integer.parseInt(request.getParameter("reviewNo")), true);
		request.setAttribute("pageNum", curPageNo);
		request.setAttribute("reviewDetail", review);
		return new ModelAndView("/board/reviewRead.jsp");
	}
	
	/**
	 * 리뷰 수정하기(update페이지로 이동하기)
	 * */
	public ModelAndView updateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reviewNo= request.getParameter("reviewNo");
		ReviewDTO review = reviewService.selectByReviewNo(Integer.parseInt(reviewNo), false);
		//String dbUserId=review.getUserId();
		
		//현재 로그인한 유저의 아이디를 세션에서 가져온다.
		//HttpSession session = request.getSession();
		//String UserId =session.getAttribute("loginUser");
		
		//db에서 가져온 데이터와 일치하는지 확인한다.
		/*if(!dbUserId.equals(UserId)||dbUserId==UserId) {
			throw new Exception("아이디가 일치하지 않습니다.게시물 수정 권한이 없습니다.");
		}*/
		request.setAttribute("review", review);
		//System.out.println(review.getReviewContent());
		
		return new ModelAndView("board/reviewUpdate2.jsp");
	}
	
	/**
	 * 리뷰 수정하기
	 * */
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getServletContext().getRealPath("/img/save");
		int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		System.out.println(saveDir);
		
		MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		
		String reviewNo= m.getParameter("reviewNo");
		String reviewTitle = m.getParameter("review_title");
		String reviewGoods = m.getParameter("review_select_goods");
		String reviewRate = m.getParameter("rate");
		String reviewContent =m.getParameter("review_contents");
		
		//HttpSession session = request.getSession();s
		//String reviewUser = session.getAttribute("loginUser");
		String reviewUser = "happy01";
		
		System.out.println("수정하는 리뷰번호: "+reviewNo+"상품이름: "+reviewGoods);
		
		ReviewDTO review = new ReviewDTO(Integer.parseInt(reviewNo),reviewUser,reviewGoods,reviewTitle,reviewContent,Integer.parseInt(reviewRate));
		
			//파일첨부를 했다면(파일을 수정했다면)
			if(m.getFilesystemName("review_image")!=null) {
				//기존에 등록한 첨부파일을 삭제한다.
				
				
				String reviewAttach =m.getFilesystemName("review_image");
				//파일 이름을 reviewDTO에 저장한다.
				review.setReviewAttach(reviewAttach);
				//데이터베이스에 이미지와 함께 수정한다.
				//connection을 유지하기 위해 reviewService.updateFaqImg 작성안했다. 
				//나중에 필요하면 만들기
				//reviewService.updateFaqImg(Integer.parseInt(reviewNo), reviewAttach);
				System.out.println("수정하려는 첨부파일이름: "+reviewAttach);
			}
		//나머지 입력값을 수정한다.
		//saveDir: 오류를 대비해서 첨부파일을 삭제할 save 경로도 보낸다.
		reviewService.updateReview(review,saveDir);
		
		//수정완료하면 조회수 증가 없이 상세보기 페이지로 이동한다.
		ReviewDTO dbreview = reviewService.selectByReviewNo(Integer.parseInt(reviewNo), false);
		request.setAttribute("reviewDetail", dbreview);
		return new ModelAndView("front?key=review&methodName=selectAll",true);
		
		//테스트용 임시 리턴
		//return new ModelAndView("front?key=review&methodName=selectAll",true);
		
	}
	
	
	/**
	 * 리뷰 작성하기
	 * */
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getServletContext().getRealPath("/img/save");
		int maxSize = 1024*1024*100;
		String encoding= "UTF-8";
		//System.out.println(saveDir);
		
		MultipartRequest m = new MultipartRequest(request, saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
		
		String reviewTitle = m.getParameter("review_title");
		String reviewGoods = m.getParameter("review_select_goods");
		String reviewRate = m.getParameter("rate");
		String reviewContent =m.getParameter("review_contents");
		
		//리뷰 작성자 아이디와 로그인한 아이디 비교하기
		//HttpSession session = request.getSession();
		//String reviewUser = session.getAttribute("loginUser");
		String reviewUser = "happy01";
		
		System.out.println("후기등록하려는 상품아이디: "+reviewGoods);
		
		ReviewDTO review = new ReviewDTO(0,reviewUser,reviewGoods,reviewTitle,reviewContent,Integer.parseInt(reviewRate));
		
			//파일 첨부 했다면(필수요소가 아니기때문에 생성자에 없으므로 추가해준다)
			if(m.getFilesystemName("review_image")!=null) {
				
				//파일이름 저장한다.
				review.setReviewAttach(m.getFilesystemName("review_image"));
				
			}
		//saveDir: 오류를 대비해서 첨부파일을 삭제할 save 경로도 보낸다.
		reviewService.insertReview(review,saveDir);
		return new ModelAndView("front?key=review&methodName=selectAll",true);
	}
	
	/**
	 * 리뷰 삭제하기
	 * */
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reviewNo = request.getParameter("reviewNo");
		ReviewDTO review = reviewService.selectByReviewNo(Integer.parseInt(reviewNo), false);
		//String dbUserId=review.getUserId();
		
		//현재 로그인한 유저의 아이디를 세션에서 가져온다.
		//HttpSession session = request.getSession();
		//String UserId =session.getAttribute("loginUser");
		
		//db에서 가져온 데이터와 일치하는지 확인한다.
		/*if(!dbUserId.equals(UserId)||dbUserId==UserId) {
			throw new Exception("아이디가 일치하지 않습니다.게시물 수정 권한이 없습니다.");
		}*/
		
		//첨부파일도 삭제할 경로를 구한다.
		String path =request.getServletContext().getRealPath("/img/save");
		//삭제할 첨부파일이름을 구한다.
		System.out.println("삭제할 후기 게시물 번호: "+review.getReviewNo());
		reviewService.deleteReview(review,path);
		
		//삭제를 마치면 게시물 list로 돌아간다.
		return new ModelAndView("front?key=review&methodName=selectAll",true);
	}
	
	/**
	 * 관리자용 - 리뷰 전체 조회하기(+페이지처리)
	 * 
	 * */
	public ModelAndView selectAllManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		//페이지처리
		String curPageNo = request.getParameter("pageNum");
		if(curPageNo ==null||curPageNo.equals("")) {
			curPageNo="1";
		}
		String field =request.getParameter("field");
		if(field==null||field.equals("")) {
			field="reg";
		}

		System.out.println("관리자 selectAll: "+field+" 페이지 번호: "+curPageNo);
		List<ReviewDTO> reviewList = reviewService.selectAllByPagingManager(Integer.parseInt(curPageNo), field);

		request.setAttribute("list", reviewList);
		request.setAttribute("pageNum", curPageNo);
		return new ModelAndView("/manager/reviewListBlind.jsp");
	}
	/**
	 * 관리자용 - 게시글 블라인드 처리
	 * 
	 * */
	public ModelAndView updateBlind(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reviewNo= request.getParameter("reviewNo");
		String blindStatus = request.getParameter("blindStatus"); //선택한 게시글의 블라인드상태
		
		System.out.println(reviewNo+": 현재 블라인드 상태"+blindStatus);
		
		reviewService.updateBlind(Integer.parseInt(reviewNo), blindStatus);
		
		return new ModelAndView("front?key=review&methodName=selectAllManager",true);
	}
	

}
