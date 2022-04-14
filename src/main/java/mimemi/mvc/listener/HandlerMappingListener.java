package mimemi.mvc.listener;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import mimemi.mvc.controller.Controller;

/**
 * 서버가 start될 때 각각의 Controller의 구현체에 미리 생성해서 map에 저장
 * 
 */
@WebListener
public class HandlerMappingListener implements ServletContextListener {
	
	public void contextInitialized(ServletContextEvent e)  { 
		Map<String, Controller> map = new HashMap<String, Controller>();
		Map<String, Class<?>> clzMap = new HashMap<String, Class<?>>();
		
		ServletContext application = e.getServletContext();
		String fileName = application.getInitParameter("fileName");
		
		// properties 파일 로딩
//		ResourceBundle rb = ResourceBundle.getBundle(yuda/mvc/listener/actionMapping);
		ResourceBundle rb = ResourceBundle.getBundle(fileName);
		
		try {
			for(String key : rb.keySet()) {
				String value = rb.getString(key);
				 
				// String 문자열을 Controller 객체로 생성해야 함
				 
				Class<?> className = Class.forName(value);
				Controller controller = (Controller)className.getDeclaredConstructor().newInstance();
				System.out.println("Controller = " + controller);
				   	 
				map.put(key, controller);
				clzMap.put(key, className);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		application.setAttribute("map", map);
		application.setAttribute("clzMap", clzMap);
		application.setAttribute("path", application.getContextPath());
	}

}
