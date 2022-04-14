package mimemi.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	ModelAndView hendlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
