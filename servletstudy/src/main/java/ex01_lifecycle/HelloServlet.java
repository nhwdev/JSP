package ex01_lifecycle;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet 
 * 1. 패키지 생성 : ex01_lifecycle 
 * 2. new > servlet 
 * 		servlet name : HelloServlet
 */
/*
 * 1번째 실행 ========
 * 생성자 호출
 * init 메서드 호출
 * service 메서드 호출
 * doGet 메서드 호출
 * 2번째 실행 =========
 * service 메서드 호출
 * doGet 메서드 호출
 */
@WebServlet("/HelloServlet") // url 매핑 정보. http://localhost:8080/servletstudy/HelloServlet 요청 : WebServlet 어노테이션 기능
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 * 1. 생성자
	 * 	1) HellowServlet 클래스의 객체 생성시 호출
	 * 	2) 생성된 객체는 메모리에 남아있음. 재호출시 재사용됨.
	 *  3) init 메서드 호출됨
	 * 2. init() 메서드
	 * 	1) 서블릿 환경 설정 기능
	 * 	2) 서블릿 객체 생성 후 한번만 실행 됨
	 * 3. service() 메서드
	 * 	1) 요청 시 마다 호출됨. 요청 처리 메서드
	 * 	2) 요청방식(GET, POST)에 따라 doGet,doPost 메서드 호출함
	 * 	3) 구현하지 않아도 됨 => 상위 클래스에서 이미 doGet, doPost 메서드를 호출하도록 구현되어 있음
	 */
	public HelloServlet() { // 생성자
		super();
		System.out.println("생성자 호출");
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service 메서드 호출");
		switch(req.getMethod()) {
		case "GET" : 
			doGet(req,resp);
			break;
		case "POST" :
			doPost(req,resp);
			break;
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *      
	 * 1. Get 방식 요청시 호출되는 메서드 : 구현 필요.
	 * 2. 기본 요청 밧기
	 * 	1) 브러우저의 url : http://localhost:8080/servletstudy/HelloServlet
	 * 	2) <a href="http://localhost:8080/servletstudy/HelloServlet"></a>
	 * 	3) <form action="http://localhost:8080/servletstudy/HelloServlet"></form>
	 * 	4) open("http://localhost:8080/servletstudy/HelloServlet", "", op)
	 * 	5) $.ajax({
	 * 				type: "GET", 
	 * 				url: http://localhost:8080/servletstudy/HelloServlet"
	 * 		})
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet 메서드 호출");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 1. Post 방식 요청시 호출되는 메서드 : 구현 필요
	 * 	1) <form method="POST" action="http://localhost:8080/servletstudy/HelloServlet"></form>
	 * 	2) $.ajax({
	 * 				type: "POST", 
	 * 				url: http://localhost:8080/servletstudy/HelloServlet"
	 * 		})
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
		doGet(request, response);
	}
}