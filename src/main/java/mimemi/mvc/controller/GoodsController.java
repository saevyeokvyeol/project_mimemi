package mimemi.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mimemi.mvc.service.GoodsService;
import mimemi.mvc.service.GoodsServiceImpl;

//import mimemi.mvc.service.CartService;
//import mimemi.mvc.service.CartServiceImpl;
//
//public class CartController implements Controller {
//	private CartService cartService = new CartServiceImpl();

public class GoodsController implements Controller {
	private GoodsService goodsService = new GoodsServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
