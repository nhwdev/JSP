package test0303;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Order() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println("<html><head><title>test1</title><body>");
		pw.println("<h3>Post Pizza</h3>");
		pw.println("<table border='1'><tr><th>이름</th><td>" + request.getParameter("userName") + "</td></tr>");
		pw.println("<tr><th>전화번호</th><td>" + request.getParameter("phone") + "</td></tr>");
		pw.println("<tr><th>주소</th><td>" + request.getParameter("address") + "</td></tr>");
		pw.println("<tr><th>요청사항</th><td>" + request.getParameter("message") + "</td></tr>");
		pw.println("</table></body></head></html>");
	}
}