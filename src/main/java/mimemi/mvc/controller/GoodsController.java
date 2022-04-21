package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.LiveCouponDTO;
import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.service.GoodsService;
import mimemi.mvc.service.GoodsServiceImpl;
import net.sf.json.JSONArray;

public class GoodsController implements Controller {
	private static GoodsService goodsService = new GoodsServiceImpl();
	
	// VIEW를 반환하는 Controller (Controller)
	/***
	 * 상품조회
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView goodsSelectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("manager/goods_Main_Mg.jsp");
		return mv;
	}
	
	/**
	 * 상품추가
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView goodsInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("manager/goods_Main_Mg.jsp");
		return mv;
	}
	/**
	 * 상품조회(사용자 페이지)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("goods/goodsList.jsp");
		return mv;
	}
	
	/**
	 * 상품상세보기
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView goodsView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String goodsId = request.getParameter("goodsId");
		ModelAndView mv = new ModelAndView("goods/goodsView.jsp");
		request.setAttribute("goodsId", goodsId);
		return mv;
	}
	
	
	// 단순히 데이터만 제공해주는 API Controller (RestController)
	public void getGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<GoodsDTO> goodsList = goodsService.goodsSelectAll();
		JSONArray goodsArr = JSONArray.fromObject(goodsList);
		PrintWriter out = response.getWriter();
		out.print(goodsArr);
	}
	// 상품 Y값만 조회하기
	public void getGoodsSelectForSale(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<GoodsDTO> goodsList = goodsService.goodsSelectForSale();
		JSONArray goodsArr = JSONArray.fromObject(goodsList);
		PrintWriter out = response.getWriter();
		out.print(goodsArr);
	}
	
	
	// 상품 이름으로 조회하기 (특정조건조회)
	public void getGoodsSelectByKeyword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String keyword = request.getParameter("keyword");
		List<GoodsDTO> goodsList = goodsService.goodsSelectByKeyword(keyword);
		JSONArray goodsArr = JSONArray.fromObject(goodsList);
		PrintWriter out = response.getWriter();
		out.print(goodsArr);
	}
	
	
	// 상품이름으로 상품상세조회하기
	public void getSelectByGoodsId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String goodsId = request.getParameter("goodsId");
		GoodsDTO goods = goodsService.selectByGoodsId(goodsId);
		JSONArray goodsArr = JSONArray.fromObject(goods);
		PrintWriter out = response.getWriter();
		out.print(goodsArr);
	}
	
	//상품 추가하기
	public void getGoodsInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String goodsId = request.getParameter("goodsId");
		String goodsName = request.getParameter("goodsName");
		String goodsDetail = request.getParameter("goodsDetail");
		String goodsThumbnail = request.getParameter("goodsThumbnail");
		int goodsPrice = Integer.parseInt(request.getParameter("goodsPrice"));
		String goodsSale = request.getParameter("goodsSale");
		GoodsDTO goods = new GoodsDTO(goodsId, goodsName, goodsDetail, goodsThumbnail, goodsPrice, goodsSale);
		goodsService.goodsInsert(goods);
	}
	
	//상품 수정하기
	public ModelAndView getGoodsUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String goodsId = request.getParameter("goodsId");
		String goodsName = request.getParameter("goodsName");
		String goodsDetail = request.getParameter("goodsDetail");
		String goodsThumbnail = request.getParameter("goodsThumbnail");
		int goodsPrice = Integer.parseInt(request.getParameter("goodsPrice"));
		String goodsSale = request.getParameter("goodsSale");
		
		GoodsDTO dto = new GoodsDTO(goodsId, goodsName, goodsDetail, goodsThumbnail, goodsPrice, goodsSale);
		goodsService.goodsUpdate(dto);

		//return new ModelAndView("front?key=coupon&methodName=selectAllLiveCp", true);
		return new ModelAndView("manager/goodsSelectAll.jsp");
	}
	

	public void selectOrderGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		List<GoodsDTO> goodsList = goodsService.selectOrderGoods(userId);
		
		JSONArray arr = JSONArray.fromObject(goodsList);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
