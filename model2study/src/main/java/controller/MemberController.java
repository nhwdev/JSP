package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Member;
import model.MemberDao;

@WebServlet(urlPatterns = { "/member/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MemberController extends MskimRequestMapping {
	private MemberDao dao = new MemberDao();

	/*
	 * 회원가입 폼 : http://localhost:8080/model2study/member/joinForm 메서드 없으면
	 * /webapp/view/member/joinForm.jsp view 로 호출
	 */
	@RequestMapping("join")
	public String join(HttpServletRequest request, HttpServletResponse response) {
		// request : CharEncodingFilter 에서 인코딩 완료된 객체
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		if (dao.insert(mem)) {
			request.setAttribute("msg", mem.getName() + "님 회원 가입 되었습니다.");
			request.setAttribute("url", "loginForm");
		} else {
			request.setAttribute("msg", mem.getName() + "님 회원가입시 오류 발생 했습니다.");
			request.setAttribute("url", "joinForm");
		}
		return "alert"; // view 의 이름 /webapp/view/alert.jsp
	}

	@RequestMapping("login") // http://localhost:8080/model2study/member/login
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = dao.selectOne(id);
		String msg = null;
		String url = "loginForm";
		if(mem==null) {
			msg = "아이디를 확인하세요.";
		} else if(!pass.equals(mem.getPass())) {
			msg = "비밀번호가 틀립니다.";
		} else {
			msg = mem.getName() + "님이 로그인 하셨습니다.";
			url = "main";
			request.getSession().setAttribute("login", id);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	/*
	 * 1. 로그인 여부 검증 → main 페이지는 로그인 상태에서만 조회가 되어야 함 
	 * 현재 로그인 상태 : main 현재 화면 출력 
	 * 로그아웃 상태 : 로그인이 필요한 화면입니다. 메세지 출력 후 loginForm 페이지로 이동
	 */
	@RequestMapping("main") // http://localhost:8080/model2study/member/main
	public String main(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		}
		return "member/main";
	}
	
	@RequestMapping("logout") // http://localhost:8080/model2study/member/logout
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "redirect:loginForm"; // loginForm을 redirect 하도록 MskimRequestMapping 서블릿에서 설정
	}

	/*
	 * 1. 파라미터 값 (email, tel) 저장 
	 * 2. DB에서 두개의 파라미터를 이용하여 id 값을 리턴해주는 함수 String MemberDao.idsearch(email, tel) 
	 * 3. id 존재 : 화면 뒤쪽 2자를 ** 표시하여 화면에 출력하기 
	 * 				아이디 전송 버튼을 클릭하면 opner 창에id 입력란에 전달, id 화면을 닫기 
	 * 				id 없음 : "id 가 없습니다." 현재화면 idForm 페이지로 이동
	 */
	@RequestMapping("id")
	public String idSearch(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = new MemberDao().idSearch(email, tel);
		if(id==null) {
			request.setAttribute("msg", "해당되는 아이디가 없습니다.");
			request.setAttribute("url",	"idForm");
			return "alert";
		} else {
			request.setAttribute("id", id);
			return "member/id";
		}
	}
	
	/*
	 * 1. 파라미터(id, email, tel) 저장 
	 * 2. DB에서 id, email, tel 을 이용하여 pass 값을 리턴 pass = MemberDao.pwSearch(id, email, tel)
	 * 3. 비밀번호 검증 
	 * 	  - 비밀번호 찾은 경우 : 화면에 앞 2자리는 **로 표시하여 화면에 출력. 
	 * 						     닫기버튼 클릭시 현재 화면 닫기 
	 *    - 비밀번호 못찾은 경우 : 정보에 맞는 비밀번호를 찾을 수 없습니다. 
	 *    					       메시지 출력 후 현재 페이지를 pwForm로 이동
	 */
	@RequestMapping("pw")
	public String pwSearch(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		String pass = dao.pwSearch(id, email, tel);
		if(pass==null) {
			request.setAttribute("msg", "비밀번호를 찾을 수 없습니다.");
			request.setAttribute("url",	"pwForm");
			return "alert";
		} else {
			request.setAttribute("pass", pass);
			return "member/pw";
		}
	}
	
	/*
	 * 1. id 파라미터 
	 * 2. id 를 이용하여 DB에서 조회 
	 * 3. DB에서 조회 안되는 경우 : 사용가능한 아이디 입니다. 초록색 화면 출력 
	 *    DB에서 조회 되는 경우 : 사용 중인 아이디 입니다. 빨강색 화면 출력. 등록된 아이디를 초기화 
	 * 4. 닫기 버튼 클릭되면 화면 닫기
	 */
	@RequestMapping("idchk")
	public String idchk(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Member mem = new MemberDao().selectOne(id);
		String msg = null;
		String className = null;
		if (mem == null){ 
			msg = "사용가능한 아이디 입니다.";
			className = "able";
			request.setAttribute("msg", msg);
			request.setAttribute("id", id);
			request.setAttribute("className", className);
		} else { 
			msg = "사용 중인 아이디 입니다.";
			className = "disable";
			request.setAttribute("msg", msg);
			request.setAttribute("id", id);
			request.setAttribute("className", className);
		}
		return "member/idchk";
	}
}