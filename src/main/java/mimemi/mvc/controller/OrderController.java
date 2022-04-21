package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dao.AddrDAO;
import mimemi.mvc.dto.AddrDTO;
import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.OrderDTO;
import mimemi.mvc.dto.OrderDeliDTO;
import mimemi.mvc.dto.OrderLineDTO;
import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.service.AddrService;
import mimemi.mvc.service.AddrServiceImpl;
import mimemi.mvc.service.OrderService;
import mimemi.mvc.service.OrderServiceImpl;
import net.sf.json.JSONArray;

public class OrderController implements Controller {
	private OrderService orderService = new OrderServiceImpl();
	private AddrService addrService = new AddrServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ModelAndView insertOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int addrId = Integer.parseInt(request.getParameter("addrId"));
		String payMethod = request.getParameter("payMethod");
		
		String payPoint = request.getParameter("payPoint");
		if(payPoint.equals("") || payPoint == null) {
			payPoint = "0";
		}
		
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String orderMemo = request.getParameter("orderMemo");
		String takeMethod = request.getParameter("takeMethod");
		String enterPwd = request.getParameter("enterPwd");
		
		int usercouId = Integer.parseInt(request.getParameter("usercouId"));
		
		OrderDTO order = new OrderDTO(userId, addrId, payMethod, Integer.parseInt(payPoint), totalPrice, orderMemo, takeMethod, enterPwd, usercouId);
		
		List<CartDTO> cartList = (List<CartDTO>)session.getAttribute("cartList");
		if(cartList == null) {
			throw new Exception("세션이 만료되었습니다.\\n구매 정보를 다시 확인해주세요.");
		}
		order.setCartList(cartList);
		
		String mode = request.getParameter("mode");
		
		orderService.insertOrder(order, mode);
		
		ModelAndView mv = new ModelAndView("order/complete.jsp", true);
		return mv;
	}
	
	// 주문 전체 가져오기(페이징 처리)
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		String field = request.getParameter("field");
		
		List<OrderDTO> orderList = orderService.selectAll(Integer.parseInt(pageNum), field);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("pageNum", pageNum); // 뷰에서 사용하기 위해 저장
		ModelAndView mv = new ModelAndView("manager/order_Main_Mg.jsp");
		
		return mv;
	}
	
	// 특정 유저가 구매한 내역 가져오기
	public void selectByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String userId = request.getParameter("userId");
		List<OrderDTO> orderList = orderService.selectByUserId(userId);
		
		JSONArray orderArr = JSONArray.fromObject(orderList);
		
		PrintWriter out = response.getWriter();
		out.print(orderArr);
	}

	// 주문아이디로 상세 주문 내역 가져오기
	public void selectLineByOrderId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String orderId = request.getParameter("orderId");
		List<OrderLineDTO> orderLineList = orderService.selectLineByOrderId(Integer.parseInt(orderId));
		
		JSONArray orderLineArr = JSONArray.fromObject(orderLineList);
		
		PrintWriter out = response.getWriter();
		out.print(orderLineArr);
	}
	
	public ModelAndView selectByOrderId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderId = request.getParameter("orderId");
		
		OrderDTO order = orderService.selectByOrderId(Integer.parseInt(orderId));
		List<OrderLineDTO> orderLineList = orderService.selectLineByOrderId(Integer.parseInt(orderId));
		
		AddrDTO addr = addrService.selectByAddrId(order.getAddrId());
		
		request.setAttribute("order", order);
		request.setAttribute("orderLineList", orderLineList);
		request.setAttribute("addr", addr);
		ModelAndView mv = new ModelAndView("mypage/orderView.jsp");
		
		return mv;
	}

	public void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderId = request.getParameter("orderId");

		orderService.deleteOrder(Integer.parseInt(orderId));
	}
	
	public void viewOrderCalendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderId = request.getParameter("orderId");

		orderService.deleteOrder(Integer.parseInt(orderId));
	}
	
	public void selectMlyDeli(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		String goodsId = request.getParameter("goodsId");
		
		if(goodsId == null || goodsId == "") {
			goodsId = "VEGAN01";
		}
		System.out.println(goodsId);
		
		String date = request.getParameter("date");
		
		List<OrderDeliDTO> orderDeliList = orderService.selectMlyDeli(goodsId, userId, date);
		
		JSONArray orderDeliArr = JSONArray.fromObject(orderDeliList);
		
		PrintWriter out = response.getWriter();
		out.print(orderDeliArr);
	}

}
