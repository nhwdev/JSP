package ex03_parameter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetServlet")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request 객체: 요청 객체. 클라이언트에서 요청한 정보를 저장하고 있는 객체. ex) 파라미터 정보, 헤더 정보, 메서드방식 정보등...
		// response 객체: 응답 객체. 클라이언트로 전달할 정보를 저장하고 있는 객체.
		response.setContentType("text/html; charset=UTF-8"); // 응답: 문서 형식 설정
		// model=값 : model 파라미터 값. client.html의 모델명에 입력된 내용
		String model = request.getParameter("model");		 // 요청: http://.../servletstudy/GetServlet?model=
		// price=값 : price 파라미터의 값. client.html의 가격에 입력된 내용 
		String price = request.getParameter("price");		 // 요청: http://.../servletstudy/GetServlet?model=...&price= 
		// PrintWriter : 문자형 출력스트림. 목적지가 클라이언트(response객체)
		PrintWriter pw = response.getWriter();
		pw.println("<html><head><title>파라미터연습</title><body>");
		pw.println("<h3>Get 방식 요청</h3>");
		pw.println("<table border='1'><tr><th>모델명</th><th>가격</th></tr>");
		pw.println("<tr><td>" + model + "</td><td>" + price + "</td></tr>");
		pw.println("</table></body></head></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
