package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.service.OrderService;
import mimemi.mvc.service.OrderServiceImpl;
import net.sf.json.JSONArray;

public class OrderController implements Controller {
	private OrderService orderService = new OrderServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		String field = request.getParameter("field");
		
		List<OrderDTO> orderList = orderService.selectAll(Integer.parseInt(pageNum), field);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("pageNum", pageNum); // 뷰에서 사용하기 위해 저장
		ModelAndView mv = new ModelAndView("manager/orderList.jsp");
		
		return mv;
	}

}
