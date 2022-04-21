package mimemi.mvc.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SessionCheckFilter
 */
@WebFilter(urlPatterns = {
		// "/front",
		// "/mypage"
		})
public class LoginCheckFilter extends HttpFilter implements Filter {
    
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 사전 처리: 인증된 사용자인지 체크
		System.out.println("체크");
		
		String key = request.getParameter("key");
		if(key == null || key.equals("order") || key.equals("cart") || key.equals("coupon") || key.equals("ask")) {
			// elec 접근
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			if(session.getAttribute("loginUser") == null) {
				// 인증되지 않은 사용자
				req.setAttribute("errorMsg", "로그인 후 이용 가능합니다.");
				req.getRequestDispatcher("error/error.jsp").forward(request, response);
				return; // 메소드를 빠져나가시오!
			}
		}
		
		chain.doFilter(request, response);
		
		// 사후 처리
	}

}
