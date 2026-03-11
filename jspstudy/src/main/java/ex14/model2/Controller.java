package ex14.model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller {
	public ForwardView hello(HttpServletRequest request, HttpServletResponse response) {
		// request : DispatcherServlet의 request 객체와 같은 객체 공유
		request.setAttribute("hello", "Hello World");
		return new ForwardView(false, "ex14_model2/hello.jsp");
	}
	public ForwardView loginForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("id", "admin");
		return new ForwardView(false, "ex14_model2/loginForm.jsp");
	}
}
