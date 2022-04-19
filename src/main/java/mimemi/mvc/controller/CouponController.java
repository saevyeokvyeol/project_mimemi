package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.LiveCouponDTO;
import mimemi.mvc.dto.RgCouponDTO;
import mimemi.mvc.dto.UserCouponDTO;
import mimemi.mvc.service.CouponService;
import mimemi.mvc.service.CouponServiceImpl;
import net.sf.json.JSONArray;

public class CouponController implements Controller {
	private CouponService couponService = new CouponServiceImpl();
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 실시간 쿠폰 조회
	 * @return: LiveCouponDTO
	 * */
	public void selectAllLiveCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<LiveCouponDTO> list = couponService.selectAllLiveCp();
		
		//list를 응답할 수 없기 때문에 list를 jsonArray 변환해서 보낸다.
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.println(arr);
		
	}
	
	/**
	 * 정기 쿠폰 조회
	 * @return: RgCouponDTO
	 * */
	public void selectAllRgCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<RgCouponDTO> list = couponService.selectAllRgCp();
		
		//list를 응답할 수 없기 때문에 list를 jsonArray 변환해서 보낸다.
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.println(arr);
		
	}
	
	/**
	 * 사용자별 쿠폰 조회
	 * @param: String userId
	 * @return: UserCouponDTO(회원 아이디로 검색된 전체 레코드)
	 * */
	public void selectCpByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String userId = request.getParameter("userId");
		List<UserCouponDTO> list = couponService.selectCpByUserId(userId);
		
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}
	
	/**
	 * 실시간 쿠폰 등록
	 * @param: LiveCouponDTO(String livecouId, String livecouName, int livecouPrice, int livecouUseperiod)
	 * */
	public ModelAndView insertLiveCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String livecouId = request.getParameter("id");
		String livecouName = request.getParameter("name");
		String livecouPrice = request.getParameter("price");
		String livecouPubdate = request.getParameter("pubDate");
		String livecouUseperiod = request.getParameter("endDate");
		
		LiveCouponDTO dto = new LiveCouponDTO(livecouId, livecouName, Integer.parseInt(livecouPrice), livecouPubdate, Integer.parseInt(livecouUseperiod) );
		couponService.insertLiveCp(dto);
		
		//return new ModelAndView("front?key=coupon&methodName=selectAllLiveCp", true);
		return new ModelAndView("manager/selectCouponAll.jsp", true);
		
	}
	
	/**
	 * 정기 쿠폰 등록
	 * @param: RgCouponDTO(String rgcouId, String rgcouName, int rgcouPrice, String rgcouPubdate, String rgcouEnddate)
	 * */
	public ModelAndView insertRgCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String rgcouId = request.getParameter("id");
		String rgcouName = request.getParameter("name");
		String rgcouPrice = request.getParameter("price");
		String rgcouPubdate = request.getParameter("pubDate");
		String rgcouEnddate = request.getParameter("endDate");
		
		RgCouponDTO dto = new RgCouponDTO(rgcouId, rgcouName, Integer.parseInt(rgcouPrice), rgcouPubdate, rgcouEnddate );
		couponService.insertRgCp(dto);
		
		//return new ModelAndView("front?key=coupon&methodName=selectAllLiveCp", true);
		return new ModelAndView("manager/selectCouponAll.jsp", true);
	}

	/**
	 * 실시간 쿠폰 수정(ModelAndView)
	 * @param: LiveCouponDTO(String livecouId, String livecouName, int livecouPrice, int livecouUseperiod)
	 * */
	public ModelAndView updateLiveCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String livecouId = request.getParameter("id");
		String livecouName = request.getParameter("name");
		String livecouPrice = request.getParameter("price");
		String livecouPubdate = request.getParameter("pubDate");
		String livecouUseperiod = request.getParameter("endDate");
		
		LiveCouponDTO liveCoupon = new LiveCouponDTO(livecouId, livecouName, Integer.parseInt(livecouPrice), livecouPubdate, Integer.parseInt(livecouUseperiod) );
		request.setAttribute("liveCoupon", liveCoupon);
		couponService.updateLiveCp(liveCoupon);
		
		//return new ModelAndView("front?key=coupon&methodName=selectAllLiveCp", true);
		return new ModelAndView("manager/selectCouponAll.jsp");
	}
	
	/**실시간쿠폰 수정폼*/
	public ModelAndView updateLiveCpForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String liveCouId = request.getParameter("id");
		System.out.println(liveCouId);
		
		LiveCouponDTO liveCoupon = couponService.selectLvCouByCouId(liveCouId);
		
		request.setAttribute("liveCoupon", liveCoupon);
		
		return new ModelAndView("manager/couponUpdate.jsp");
	}
	
	/**
	 * 정기 쿠폰 수정(ModelAndView)
	 * @param: RgCouponDTO
	 * */
	public ModelAndView updateRgCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String rgcouId = request.getParameter("id");
		String rgcouName = request.getParameter("name");
		String rgcouPrice = request.getParameter("price");
		String rgcouPubdate = request.getParameter("pubDate");
		String rgcouEnddate = request.getParameter("endDate");
		
		RgCouponDTO rgCoupon = new RgCouponDTO(rgcouId, rgcouName, Integer.parseInt(rgcouPrice), rgcouPubdate, rgcouEnddate );
		request.setAttribute("rgCoupon", rgCoupon);
		couponService.updateRgCp(rgCoupon);
		
		//return new ModelAndView("front?key=coupon&methodName=selectAllLiveCp", true);
		return new ModelAndView("manager/selectCouponAll.jsp");
	}
	
	/**정기쿠폰 수정폼*/
	public ModelAndView updateRgCpForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String rgcouId = request.getParameter("id");
		
		RgCouponDTO rgCoupon = couponService.selectRgCouByCouId(rgcouId);
		
		request.setAttribute("rgCoupon", rgCoupon);
		
		return new ModelAndView("manager/couponUpdate2.jsp");
	}
	
	/**

	 * 사용자별 쿠폰 등록
	 * */
	public ModelAndView insertUserCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String userId = request.getParameter("userId");
		String selectCouponType = request.getParameter("select_CouponType");
		String selectCoupon = request.getParameter("select_Coupon");
		String usercouUsable = request.getParameter("usercouUsable");
		String usercouPubdate = request.getParameter("usercouPubdate");
		String usercouEnddate = request.getParameter("usercouPubdate");
		
		UserCouponDTO userCouponDTO=null;
		
		if(selectCouponType.equals("LiveCp")) {
			userCouponDTO = new UserCouponDTO(userId, selectCoupon, null , usercouUsable, usercouPubdate, usercouEnddate );
		}else if(selectCouponType.equals("RgCp")) {
			userCouponDTO = new UserCouponDTO(userId, null, selectCoupon , usercouUsable, usercouPubdate, usercouEnddate );
		}
		
		couponService.insertUserCp(userCouponDTO, selectCouponType);
		
		return new ModelAndView("manager/selectCouponUserAll.jsp", true);
		
	}
	
	/**
	 * 전체 사용자 쿠폰 조회
	 * */
	public ModelAndView selectAllUserCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String field = request.getParameter("field");
		
		
		List<UserCouponDTO> userCouponList = couponService.selectAllUserCp(field);
		
		request.setAttribute("userCouponList", userCouponList);
		
		return new ModelAndView("manager/selectCouponUserAll.jsp");
	}
	
	/**
	 * 사용자별 쿠폰 사용여부 수정
	 * @param: int usercouId, String state(유저 아이디와 쿠폰 사용 여부)
	 * */

	public void updateCpState(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userCouId = request.getParameter("userCouId");
		String usercouUsable = request.getParameter("usercouUsable");
		
			
		couponService.updateCpState(Integer.parseInt(userCouId), usercouUsable);
		
		
	}
	

	 /* 아이디로 실시간 쿠폰/정기 쿠폰 조회
	 * */
	public void selectCouByCouId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String CouId = request.getParameter("CouId");
		LiveCouponDTO LvCou = null;
		RgCouponDTO RgCou = null;
		JSONArray arr = null;
		if(CouId.substring(0, 1).equals("L")) {
			LvCou = couponService.selectLvCouByCouId(CouId);
			arr = JSONArray.fromObject(LvCou);
		} else {
			RgCou = couponService.selectRgCouByCouId(CouId);
			arr = JSONArray.fromObject(RgCou);
		}
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}

}
