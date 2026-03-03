package ex03_parameter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); // 응답: 문서 형식 설정
		String model = request.getParameter("model");		 // 요청: http://.../servletstudy/PostServlet
		String price = request.getParameter("price");
		PrintWriter pw = response.getWriter();
		pw.println("<html><head><title>파라미터연습</title></head><body>");
		pw.println("<h3>POST 방식 요청</h3>");
		pw.println("<table border='1'><tr><th>모델명</th><th>가격</th></tr>");
		pw.println("<tr><td>" + model + "</td><td>" + price + "</td></tr>");
		pw.println("</table></body></html>");
	}

}
