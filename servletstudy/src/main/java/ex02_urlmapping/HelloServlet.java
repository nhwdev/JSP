package ex02_urlmapping;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 * URLMapping 방식 : 2가지 방식을 중복하여 사용 불가
 * 1. WebServlet 어노테이션 방식 : @WebServlet(urlmapping 정보)
 * 2. web.xml파일에 <servlet>, <servlet-mapping> 방식
 */
//@WebServlet(name = "HelloServlet2", urlPatterns = { "/hello", /hi })
// 하나의 서블릿에 2개의 mapping이 가능함 : /hello, /hi
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.getContextPath() : 프로젝트 이름
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
