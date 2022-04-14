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
 * 서버가 시작될 때 각각의 Controller의 구현체를 미리 생성해 map에 저장
 */
@WebListener
public class AjaxHandlerMappingListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent e)  { 
        // 컨트롤러와 클래스를 저장할 맵 생성
    	Map<String, Controller> map = new HashMap<String, Controller>();
        Map<String, Class<?>> clzMap = new HashMap<String, Class<?>>();
        
        // properties 파일을 가져오기 위해 resourseBundle 객체를 생성해 properties 가져오기
        ResourceBundle rb = ResourceBundle.getBundle("ajaxMapping");
        
        try {
			for(String key : rb.keySet()) { // key 배열을 하나씩 꺼내와
				String value = rb.getString(key); // key를 이용해 value를 가져오기
				
				// String 타입인 value를 이용해 Controller 객체 생성
				Class<?> className = Class.forName(value);
				Controller controller = (Controller)className.getDeclaredConstructor().newInstance();
				System.out.println("Controller = " + controller);
				
				// map에는 Controller로 다운캐스팅한 객체를,
				// clzMap은 추후 메소드를 꺼내 사용하기 위해 Class<?> 타입의 객체를 저장
				map.put(key, controller);
				clzMap.put(key, className);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
        
        // application 영역에 map, clzMap 저장
        ServletContext application = e.getServletContext();
        application.setAttribute("ajaxMap", map);
        application.setAttribute("ajaxClzMap", clzMap);
        
        // 부가 옵션: 현재 프로젝트의 루트 경로를 application에 저장해 경로 설정할 때 사용
        application.setAttribute("path", application.getContextPath());
        
    }
	
}
