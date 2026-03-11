package ex14.model2;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:8080/jspstudy/hello.do
@WebServlet(urlPatterns = { "*.do" }, //.do 요청시 호출되는 서블릿 
			initParams = { @WebInitParam(name = "properties", value = "url.properties") })
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties pr = new Properties(); // url
	private Controller action = new Controller();
	private Class[] paramType = new Class[] { HttpServletRequest.class, HttpServletResponse.class };

	public DispatcherServlet() {
		super();
	}
	/*
	 * url.properties 파일을 읽어서, pr 객체에 key = value 쌓인 객체로 저장
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// config : properties = url.properties
		FileInputStream f = null;
		// props : url.properties
		String props = config.getInitParameter("properties");
		try {
			// config.getServletContext().getRealPath("/" : 웹 어플리케이션 폴더
			// f : url.properties 파일을 읽기 위한 입력 스트림
			f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
			pr.load(f); // Properties : HashTable 클래스의 하위클래스. <String, String> Map 객체
						// key = value : "/hello.do" = "hello"
			f.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 파라미터 값 인코딩
		Object[] paramObjs = new Object[] { request, response };
		ForwardView view = null;
		String command = null;
		try {
			// request.getRequestURI() : /jspstudy/hello.do
			// request.getContextPath() : /jspstudy
			// command : /hello.do
			command = request.getRequestURI().substring(request.getContextPath().length());
			// methodName : hello
			String methodName = pr.getProperty(command); // pr.getProperty("/hello.do");
			// action.getClass() : Controller 클래스 정보 (Object 멤버)
			// getMethod(methodName, paramType) : 메서드 정보
			/*
			 * action.getClass().getMethod(methodName, paramType)
			 * 	Controller 클래스에서 이름이 hello 이고, 매개변수 타입이 paramType과 같은 메서드 객체 리턴
			 */
			// method : Controller.hello() 메서드 저장
			Method method = action.getClass().getMethod(methodName, paramType);
			/*
			 * method.invoke(action, paramObjs) : action 객체에 있는 hello 메서드를 호출
			 * view : new ForwardView(false, "ex14_model2/hello.jsp")
			 */
			view = (ForwardView) method.invoke(action, paramObjs);
		} catch (NullPointerException e) {
			view = new ForwardView(); e.printStackTrace();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		if (view.isRedirect()) {
			response.sendRedirect(view.getView()); // redirect
		} else { // forward
			RequestDispatcher disp = request.getRequestDispatcher(view.getView());
			disp.forward(request, response); // ex14_model2/hello.jsp
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
