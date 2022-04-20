package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.MealDTO;
import mimemi.mvc.service.MealService;
import mimemi.mvc.service.MealServiceImpl;
import net.sf.json.JSONArray;

public class MealController implements Controller {

	private MealService mealService = new MealServiceImpl();
	
	// VIEW를 반환하는 Controller (Controller)
	public ModelAndView mealSelectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("manager/mealAll.jsp");
		return mv;
	}
	
	// 단순히 데이터만 제공해주는 API Controller (RestController)
	public void getMealList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<MealDTO> mealList = mealService.mealSelectAll();
		JSONArray mealArr = JSONArray.fromObject(mealList);
		PrintWriter out = response.getWriter();
		out.print(mealArr);
	}
	
	public void getMealSelectForSale(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<MealDTO> mealList = mealService.mealSelectForSale();
		JSONArray mealArr = JSONArray.fromObject(mealList);
		PrintWriter out = response.getWriter();
		out.print(mealArr);
	}

	public void mealSelectByMealId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String keyword = request.getParameter("keyword");
		List<MealDTO> mealList = mealService.mealSelectByMealId(keyword);
		JSONArray mealArr = JSONArray.fromObject(mealList);
		PrintWriter out = response.getWriter();
		out.print(mealArr);
	}
	
	public void getMealInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); 
		String mealId = request.getParameter("mealId");
		String goodsId = request.getParameter("goodsId");
		String mealName = request.getParameter("mealName");
		int mealWeight = Integer.parseInt(request.getParameter("mealWeight"));
		int mealKcal = Integer.parseInt(request.getParameter("mealKcal"));
		int mealCarbo = Integer.parseInt(request.getParameter("mealCarbo"));
		int mealProtein = Integer.parseInt(request.getParameter("mealProtein"));
		int mealFat = Integer.parseInt(request.getParameter("mealFat"));
		String mealImg = request.getParameter("mealImg");
		String mealSale = request.getParameter("mealSale");
		MealDTO meal = new MealDTO(mealId, goodsId, mealName, mealWeight, mealKcal, mealCarbo, mealProtein, mealFat, mealImg, mealSale);
		mealService.mealInsert(meal);
	}
	
	public void getMealUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); 
		String mealId = request.getParameter("mealId");
		String goodsId = request.getParameter("goodsId");
		String mealName = request.getParameter("mealName");
		int mealWeight = Integer.parseInt(request.getParameter("mealWeight"));
		int mealKcal = Integer.parseInt(request.getParameter("mealKcal"));
		int mealCarbo = Integer.parseInt(request.getParameter("mealCarbo"));
		int mealProtein = Integer.parseInt(request.getParameter("mealProtein"));
		int mealFat = Integer.parseInt(request.getParameter("mealFat"));
		String mealImg = request.getParameter("mealImg");
		String mealSale = request.getParameter("mealSale");
		MealDTO meal = new MealDTO(mealId, goodsId, mealName, mealWeight, mealKcal, mealCarbo, mealProtein, mealFat, mealImg, mealSale);
		mealService.mealUpdate(meal);
	}
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
