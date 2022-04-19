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
	 * �ǽð� ���� ��ȸ
	 * @return: LiveCouponDTO
	 * */
	public void selectAllLiveCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<LiveCouponDTO> list = couponService.selectAllLiveCp();
		
		//list�� ������ �� ���� ������ list�� jsonArray ��ȯ�ؼ� ������.
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.println(arr);
		
	}
	
	/**
	 * ���� ���� ��ȸ
	 * @return: RgCouponDTO
	 * */
	public void selectAllRgCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<RgCouponDTO> list = couponService.selectAllRgCp();
		
		//list�� ������ �� ���� ������ list�� jsonArray ��ȯ�ؼ� ������.
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.println(arr);
		
	}
	
	/**
	 * ����ں� ���� ��ȸ
	 * @param: String userId
	 * @return: UserCouponDTO(ȸ�� ���̵�� �˻��� ��ü ���ڵ�)
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
	 * �ǽð� ���� ���
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
	 * ���� ���� ���
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
	 * �ǽð� ���� ����(ModelAndView)
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
	
	/**�ǽð����� ������*/
	public ModelAndView updateLiveCpForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String liveCouId = request.getParameter("id");
		System.out.println(liveCouId);
		
		LiveCouponDTO liveCoupon = couponService.selectLvCouByCouId(liveCouId);
		
		request.setAttribute("liveCoupon", liveCoupon);
		
		return new ModelAndView("manager/couponUpdate.jsp");
	}
	
	/**
	 * ���� ���� ����(ModelAndView)
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
	
	/**�������� ������*/
	public ModelAndView updateRgCpForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String rgcouId = request.getParameter("id");
		System.out.println(rgcouId);
		
		RgCouponDTO rgCoupon = couponService.selectRgCouByCouId(rgcouId);
		
		request.setAttribute("rgCoupon", rgCoupon);
		
		return new ModelAndView("manager/couponUpdate2.jsp");
	}
	
	
}