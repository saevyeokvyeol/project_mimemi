package mimemi.mvc.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("/front")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// application에서 받아올 map을 저장할 객체 생성
	Map<String, Controller> map;
	Map<String, Class<?>> clzMap;
    
	@Override
	public void init() throws ServletException {
		// 클래스가 호출되면 가장 먼저 호출되는 init 메소드에서 map, clzMap 호출해 저장
		map = (Map<String, Controller>)super.getServletContext().getAttribute("map");
		clzMap = (Map<String, Class<?>>)super.getServletContext().getAttribute("clzMap");
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request 영역에서 key값과 methodName값 가져와 저장
		String key = request.getParameter("key");
		String methodName = request.getParameter("methodName");
		
		if(key == null) {
			key = "elec";
		}
		
		if(methodName == null) {
			methodName = "select";
		}
		
		System.out.println("key = " + key + ", methodName = " + methodName);
		try {
			// clzMap에서 키 값에 해당하는 밸류(클래스) 가져와 저장
			Class<?> clz = clzMap.get(key);
			// 위에서 저장한 클래스에서 메소드 이름으로 메소드를 가져옴(가져올 때 매개변수도 함께 입력)
			Method method = clz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			
			// 키 값에 해당하는 컨트롤러를 가져옴
			Controller controller = map.get(key);
			
			// 컨트롤러에서 메소드를 호출한 뒤 리턴값을 ModelAndView에 저장
			ModelAndView mv = (ModelAndView)method.invoke(controller, request, response);
			
			// isRedirect 값에 따라 이동 방식 결정
			if(mv.isRedirect()) { // true면 redirect 방식
				response.sendRedirect(mv.getViewName());				
			} else { // false면 forward 방식
				request.getRequestDispatcher(mv.getViewName()).forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getCause().getMessage());
			request.getRequestDispatcher("error/error.jsp").forward(request, response);
		}
	}
}
