package mimemi.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dto.ManagerDTO;
import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.service.ManagerService;
import mimemi.mvc.service.ManagerServiceImpl;

public class ManagerController implements Controller {
	private ManagerService managerService = new ManagerServiceImpl();

	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 로그인 기능
	 * */
	public ModelAndView loginManager(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//userId, userPwd 받기
		String managerId= request.getParameter("userId");
		String managerPwd = request.getParameter("userPwd");
		
		ManagerDTO dbDTO = managerService.loginManager(managerId,managerPwd);
		System.out.println(dbDTO.getManagerName());
		System.out.println(dbDTO.getManagerId());
		HttpSession session = request.getSession();
		session.setAttribute("loginManager", dbDTO);
		session.setAttribute("loginName", dbDTO.getManagerName());
		
		return new ModelAndView("manager/managerIndex.jsp", true);
	}

}
