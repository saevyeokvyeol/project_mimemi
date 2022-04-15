package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.dto.CartDTO;
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
}
