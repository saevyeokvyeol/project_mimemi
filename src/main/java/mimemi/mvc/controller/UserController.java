package mimemi.mvc.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mimemi.mvc.dto.UserDTO;
import mimemi.mvc.service.AddrService;
import mimemi.mvc.service.AddrServiceImpl;
import mimemi.mvc.service.UserService;
import mimemi.mvc.service.UserServiceImpl;
import net.sf.json.JSONArray;

public class UserController implements Controller {
	private UserService userService = new UserServiceImpl();
	private AddrService addrService = new AddrServiceImpl();
	
	@Override
	public ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	/**
	 * 회원가입
	 * */
	public ModelAndView insertUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userBirth = request.getParameter("userBirth"); //주소값 따로 처리하는 방법 다시한번 설명해주세요...
		
		
		
		return new ModelAndView("user/join02.jsp");
	}
	
	/**
	 * 로그인 기능
	 * */
	public ModelAndView loginUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//userId, userPwd 받기
		String userId= request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		UserDTO dbDTO = userService.loginUser(new UserDTO(userId,userPwd));
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dbDTO);
		session.setAttribute("loginName", dbDTO.getUserName());
		
		return new ModelAndView("userTest.jsp", false);
	}
//	public void loginUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		response.setContentType("text/html;charset=UTF-8");
//		
//		//userId, userPwd 받기
//		String userId= request.getParameter("userId");
//		String userPwd = request.getParameter("userPwd");
//		
//		UserDTO dbDTO = userService.loginUser(new UserDTO(userId,userPwd));
//		
//		JSONArray arr = JSONArray.fromObject(dbDTO);
//		
//		PrintWriter out = response.getWriter();
//		out.print(arr);
//	}
	/**
	 * 로그아웃 기능
	 * */
	public ModelAndView logoutUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return new ModelAndView("index.jsp", true);
	}
	
	/**
	 * 회원정보 수정폼 열기
	 * */
	public ModelAndView updateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("userId");
		UserDTO userDTO = userService.selectByID(userId);
		
		request.setAttribute("userDTO", userDTO);
		
		return new ModelAndView("mypage/userEdit.jsp");
	}
	/**
	 * 회원정보 수정 기능
	 * */
	public ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userPhone = request.getParameter("userPhone");
		
		UserDTO userDTO = new UserDTO(userPhone);
		
		userService.updateUser(userDTO);
		
		return new ModelAndView("mypage/mypageMain.jsp");
	}
	/**
	 * 비밀변호 변경 기능
	 * */
	public ModelAndView updatePwd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		UserDTO userDTO = new UserDTO(userId, userPwd);
		
		userService.updateUserPwd(userId, userPwd, userPwd);
		
		logoutUser(request, response); //??????
		
		return new ModelAndView("user/login.jsp");
	}
	/**
	 * id찾기
	 * */
	public ModelAndView selectId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userName=request.getParameter("userName");
		String userPhone=request.getParameter("userPhone");
		
		userService.selectUserId(userName, userPhone);
		
		return new ModelAndView("user/login.jsp");
		
	}
	/**
	 * 비밀번호찾기
	 * */
	public ModelAndView selectPwd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userId=request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		
		userService.updateUserPwd(userId, userPhone, userPhone);
		
		return new ModelAndView("user/login.jsp");
	}
	
	/**
	 * 탈퇴하기 기능
	 * */
	public ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		userService.deleteUser(userId, userPwd);
		
		return new ModelAndView("index.jsp", true);
	}

}
