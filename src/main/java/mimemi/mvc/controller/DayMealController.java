package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.DayMealDTO;
import mimemi.mvc.dto.MealDTO;
import mimemi.mvc.service.DayMealService;
import mimemi.mvc.service.DayMealServiceImpl;
import net.sf.json.JSONArray;

public class DayMealController implements Controller {

	private DayMealService dayMealService = new DayMealServiceImpl();
	
	
	public ModelAndView getDayMealList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("manager/dayMeal.jsp");
		return mv;
	}

	public void dayMealSelectByMonth(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String month = request.getParameter("month");
		List<DayMealDTO> dayMealList = dayMealService.selectByMonth(month);
		JSONArray dayMealArr = JSONArray.fromObject(dayMealList);
		PrintWriter out = response.getWriter();
		out.print(dayMealArr);
	}
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
