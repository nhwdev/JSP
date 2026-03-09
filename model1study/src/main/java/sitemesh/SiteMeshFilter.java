package sitemesh;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
/*
 * Filter : 서블릿 이전에 먼저 실행. 서블릿 결과는 Filter 를 통해서 응답이 전달
 * 			request, response 객체를 변경할 수 있는 기능
 * 
 * @WebFilter("/*"): 모든 요청시 Filter 를 실행 → 현재는 response 객체만 거치도록 설정 
 */
@WebFilter("/*")
public class SiteMeshFilter extends ConfigurableSiteMeshFilter {
	
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		/*
		 * addDecoratorPath("/member/*", "/layout/layout.jsp")
		 * 	URL : /member/로 시작하는 모든 요청시 layout.jsp 페이지를 선택
		 * .addExcludedPath(url) : layouy 페이지 제외하도록 설정
		 */
		builder.addDecoratorPath("/member/*", "/layout/layout.jsp")
		.addExcludedPath("/member/picture*")
		.addExcludedPath("/member/id*")
		.addExcludedPath("/member/pw*");
	}
}
