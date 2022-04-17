package mimemi.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.service.OrderService;
import mimemi.mvc.service.OrderServiceImpl;

public class OrderController implements Controller {
	private OrderService orderService = new OrderServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ModelAndView insertOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("userId");
		int addrId = 0;
		if(request.getParameter("addrId") != null) {
			addrId = Integer.parseInt(request.getParameter("addrId"));
		}
		String payMethod = request.getParameter("payMethod");
		int payPoint = Integer.parseInt(request.getParameter("payPoint"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String orderMemo = request.getParameter("orderMemo");
		String takeMethod = request.getParameter("takeMethod");
		String enterPwd = request.getParameter("enterPwd");
		int usercouId = Integer.parseInt(request.getParameter("usercouId"));
		OrderDTO order = new OrderDTO(userId, addrId, payMethod, payPoint, totalPrice, orderMemo, takeMethod, enterPwd, usercouId);
		
		List<CartDTO> cartList = (List<CartDTO>)session.getAttribute("cartList");
		order.setCartList(cartList);
		
		String mode = request.getParameter("mode");
		
		orderService.insertOrder(order, mode);
		
		ModelAndView mv = new ModelAndView("order/complete.jsp", true);
		return mv;
	}
	
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
