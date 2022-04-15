package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.LiveCouponDTO;
import mimemi.mvc.dto.RgCouponDTO;
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
	
	
	public void selectAllLiveCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<LiveCouponDTO> list = couponService.selectAllLiveCp();
		
		//list를 응답할 수 없기 때문에 list를 jsonArray 변환해서 보낸다.
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.println(arr);
		
	}
	
	public void selectAllRgCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<RgCouponDTO> list = couponService.selectAllRgCp();
		
		//list를 응답할 수 없기 때문에 list를 jsonArray 변환해서 보낸다.
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.println(arr);
		
	}

}
