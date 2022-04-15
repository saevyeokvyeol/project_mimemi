package mimemi.mvc.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter(urlPatterns = {"/*"}, initParams = {@WebInitParam(name = "encoding", value="UTF-8")})
public class EncodingFilter extends HttpFilter implements Filter {
	private String encoding;
	
	/**
	 * 필터 호출 시 제일 먼저 호출되는 메소드에서
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// initParam에서 인코딩 방식을 가져와 String 타입으로 저장
		encoding = fConfig.getInitParameter("encoding");
	}
    
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 사전 처리
		request.setCharacterEncoding(encoding);

		chain.doFilter(request, response);
		
		// 사후 처리 없음
	}

}
