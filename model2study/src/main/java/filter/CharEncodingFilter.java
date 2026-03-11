package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
/*
 * init
 */
@WebFilter("/*")
public class CharEncodingFilter implements Filter {
	private String encoding;
	// Filter 가 처음 실행될 때 한번만 호출
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding");
		if(encoding == null) {
			encoding = "UTF-8"; // 기본 인코딩 방식으로 UTF-8 설정
		}
	}
	// 요청시 마다 호출되는 메서드
	@Override
	public void doFilter(ServletRequest request,ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(encoding); // UTF-8로 요청파라미터 정보를 인코딩
		chain.doFilter(request, response); // 다음 순서 필터 메서드를 호출 
	}
}
