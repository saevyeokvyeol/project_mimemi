package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.service.GoodsService;
import mimemi.mvc.service.GoodsServiceImpl;
import net.sf.json.JSONArray;

//import mimemi.mvc.service.CartService;
//import mimemi.mvc.service.CartServiceImpl;
//
//public class CartController implements Controller {
//	private CartService cartService = new CartServiceImpl();

public class GoodsController implements Controller {
	private static GoodsService goodsService = new GoodsServiceImpl();
	
	// VIEW를 반환하는 Controller (Controller)

	/**
	 * 상품 관리 페이지를 반환
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
//	public ModelAndView goodsSelectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		response.setContentType("text/html;charset=UTF-8");
//		List<GoodsDTO> list = goodsService.goodsSelectAll();
//		JSONArray goodsArr = JSONArray.fromObject(list);
//		PrintWriter out = response.getWriter();
//		out.print(goodsArr);
//		request.setAttribute("goodsList", goodsArr);
//		ModelAndView mv = new ModelAndView("manager/goodsSelectAll.jsp");
//		return mv;
//	}
	
	public ModelAndView goodsSelectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("manager/goodsSelectAll.jsp");
		return mv;
	}
	
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("goods/goodsList.jsp");
		return mv;
	}
	
	public ModelAndView goodsView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("goods/goodsView.jsp");
		return mv;
	}
	
	// 단순히 데이터만 제공해주는 API Controller (RestController)
	public void getGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<GoodsDTO> goodsList = goodsService.goodsSelectAll();
		JSONArray goodsArr = JSONArray.fromObject(goodsList);
		PrintWriter out = response.getWriter();
		out.print(goodsList);
	}
	
		
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
