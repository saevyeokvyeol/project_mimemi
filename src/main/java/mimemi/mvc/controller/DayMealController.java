package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.DayMealDTO;
import mimemi.mvc.dto.MealDTO;
import mimemi.mvc.service.DayMealService;
import mimemi.mvc.service.DayMealServiceImpl;
import mimemi.mvc.service.MealService;
import mimemi.mvc.service.MealServiceImpl;
import net.sf.json.JSONArray;

public class DayMealController implements Controller {

	private DayMealService dayMealService = new DayMealServiceImpl();
	private MealService mealService = new MealServiceImpl();
	
	public ModelAndView getDayMealList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("manager/monthly_Meal_Mg.jsp");
		return mv;
	}
	
	/**
	 * 상품조회(사용자 페이지)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView getDayMenuCalendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("goods/dayMenuCalendar.jsp");
		return mv;
	}

	public void dayMealSelectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		List<DayMealDTO> dayMealList = dayMealService.selectAll();
		JSONArray dayMealArr = JSONArray.fromObject(dayMealList);
		PrintWriter out = response.getWriter();		
		out.print(dayMealArr);
	}
	
	
	public void dayMealSelectByMonth(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String month = request.getParameter("month");
		List<DayMealDTO> dayMealList = dayMealService.selectByMonth(month);
		JSONArray dayMealArr = JSONArray.fromObject(dayMealList);
		PrintWriter out = response.getWriter();		
		out.print(dayMealArr);
	}
	
	public void dayMealInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int dayMenuId = Integer.parseInt(request.getParameter("dayMenuId"));
		String goodsId = request.getParameter("goodsId");
		String mealId = request.getParameter("mealId");
		String dayMenuDate = request.getParameter("dayMenuDate");
		DayMealDTO dayMeal = new DayMealDTO(dayMenuId, mealId, goodsId, dayMenuDate);
		dayMealService.dayMealInsert(dayMeal);
	}

	public void dayMealUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int dayMenuId = Integer.parseInt(request.getParameter("dayMenuId"));
		String mealId = request.getParameter("mealId");
		String dayMenuDate = request.getParameter("dayMenuDate");
		DayMealDTO dayMeal = new DayMealDTO(dayMenuId, mealId, null, dayMenuDate);
		dayMealService.dayMealUpdate(dayMeal);
	}
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
