package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.service.GoodsService;
import mimemi.mvc.service.GoodsServiceImpl;
import net.sf.json.JSONArray;

public class GoodsController implements Controller {
	private static GoodsService goodsService = new GoodsServiceImpl();
	

	public ModelAndView goodsSelectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		List<GoodsDTO> list = goodsService.goodsSelectAll();
		
		JSONArray goodsArr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(goodsArr);
		
		request.setAttribute("goodsList", goodsArr);
		ModelAndView mv = new ModelAndView("manager/goodsSelectAll.jsp");
		
		return mv;
		
	}


	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public void selectOrderGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String userId = "happy01";
		
		List<GoodsDTO> goodsList = goodsService.selectOrderGoods(userId);
		
		JSONArray arr = JSONArray.fromObject(goodsList);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}
}
