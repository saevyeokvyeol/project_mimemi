package mimemi.mvc.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dto.AddrDTO;
import mimemi.mvc.dto.GoodsDTO;
import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.service.AddrService;
import mimemi.mvc.service.AddrServiceImpl;
import net.sf.json.JSONArray;

public class AddrController implements Controller {
	AddrService addrService = new AddrServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public void selectByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		List<AddrDTO> list = addrService.selectByUserId(userId);
		
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}

	public void selectByAddrName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		List<AddrDTO> list = new ArrayList<AddrDTO>();
		AddrDTO addr = addrService.selectByAddrName(userId);
		list.add(addr);
		
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}

	public void selectByAddrId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String addrId = request.getParameter("addrId");
		
		List<AddrDTO> list = new ArrayList<AddrDTO>();
		AddrDTO addr = addrService.selectByAddrId(Integer.parseInt(addrId));
		list.add(addr);
		
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}
}
