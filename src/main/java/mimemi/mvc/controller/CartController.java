package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dto.CartDTO;
import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.service.CartService;
import mimemi.mvc.service.CartServiceImpl;
import net.sf.json.JSONArray;

public class CartController implements Controller {
	private CartService cartService = new CartServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 장바구니 추가
	 * */
	public void insertCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			out.print("로그인 후 이용해주세요.");
			return;
		}
		
		String userId = loginUser.getUserId();
		
		String goodsId = request.getParameter("goodsId");
		String cartQty = request.getParameter("cartQty");
		String cartWeekDay = request.getParameter("cartWeekDay");
		String cartPeriod = request.getParameter("cartPeriod");
		String cartStart = request.getParameter("cartStart");
		String goodsPrice = request.getParameter("goodsPrice");
		
		CartDTO cart = new CartDTO(userId, goodsId, Integer.parseInt(cartQty), cartWeekDay, cartPeriod, cartStart, Integer.parseInt(goodsPrice));
		cartService.insert(cart);
		
		out.print("상품이 장바구니에 담겼습니다.");
	}
	
	/**
	 * 구매폼에 장바구니에 담긴 상품 뿌려주기
	 * */
	public ModelAndView viewOrderForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mode = request.getParameter("mode");
		List<CartDTO> cartList = null;

		if(mode.equals("C")) { // 장바구니 전체 구매
			UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			
			cartList = cartService.selectCartByUserId(userId);
		} else if(mode.equals("S")) { // 장바구니 부분 구매
			String[] cartIds = request.getParameterValues("cartSelect");
			cartList = new ArrayList<CartDTO>();
			
			for(String id : cartIds) {
				CartDTO cart = cartService.selectCartByCartId(Integer.parseInt(id));
				cartList.add(cart);
			}
		} else if(mode.equals("D")) { // 상품란에서 바로 구매
			cartList = new ArrayList<CartDTO>();
			UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			String goodsId = request.getParameter("goodsId");
			String cartQty = request.getParameter("cartQty");
			String cartWeekDay = request.getParameter("cartWeekDay");
			String cartPeriod = request.getParameter("cartPeriod");
			String cartStart = request.getParameter("cartStart");
			String goodsPrice = request.getParameter("goodsPrice");
			System.out.println(userId);
			System.out.println(goodsId);
			System.out.println(cartQty);
			System.out.println(cartWeekDay);
			System.out.println(cartPeriod);
			System.out.println(cartStart);
			System.out.println(goodsPrice);
			CartDTO cart = new CartDTO(userId, goodsId, Integer.parseInt(cartQty), cartWeekDay, cartPeriod, cartStart, Integer.parseInt(goodsPrice));
			cartList.add(cart);
		}
		
		session.removeAttribute("cartList");
		session.setAttribute("cartList", cartList);
		
		ModelAndView mv = new ModelAndView("order/order.jsp?mode=" + mode, true);
		return mv;
	}

	/**
	 * 아이디로 장바구니 검색
	 * */
	public void selectCartByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String userId = request.getParameter("userId");
		List<CartDTO> list = cartService.selectCartByUserId(userId);
		
		JSONArray cartArr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(cartArr);
	}
	
	/**
	 * 장바구니 수량 변경
	 * */
	public void updateCartQty(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		int cartQty = Integer.parseInt(request.getParameter("cartQty"));
		
		cartService.updateCartQty(cartId, cartQty);
	}
	
	/**
	 * 장바구니 요일 변경
	 * */
	public void updateCartWeekday(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		String cartWeekday = request.getParameter("cartWeekday");
		
		cartService.updateCartWeekday(cartId, cartWeekday);
	}
	
	/**
	 * 장바구니 기간 변경
	 * */
	public void updateCartPeriod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		String cartPeriod = request.getParameter("cartPeriod");
		
		cartService.updateCartPeriod(cartId, cartPeriod);
	}
	
	/**
	 * 장바구니 첫 배송일 변경
	 * */
	public void updateCartStart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		String cartStart = request.getParameter("cartStart");
		
		cartService.updateCartStart(cartId, cartStart);
	}

	/**
	 * 장바구니 부분 삭제
	 */
	public void deleteSelectedCart(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String[] arr = request.getParameterValues("cartId");
		List<Integer> cartId = new ArrayList<Integer>();
		for(String str : arr) {
			cartId.add(Integer.parseInt(str));
		}
		
		cartService.deleteSelectedCart(cartId);
	}

	/**
	 * 장바구니 전체 삭제
	 */
	public void deleteAllCart(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String userId = request.getParameter("userId");
		
		cartService.deleteAllCart(userId);
	}
}
