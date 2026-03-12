package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Member;
import model.MemberDao;

@WebServlet(urlPatterns = { "/member/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MemberController extends MskimRequestMapping {
	private MemberDao dao = new MemberDao();

	/*
	 * 회원가입 폼 : http://localhost:8080/model2study/member/joinForm 메서드 없으면
	 *			     /webapp/view/member/joinForm view 호출
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
		return "alert"; // view 의 이름 /webapp/view/alert
	}

	@RequestMapping("login") // http://localhost:8080/model2study/member/login
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = dao.selectOne(id);
		String msg = null;
		String url = "loginForm";
		if (mem == null) {
			msg = "아이디를 확인하세요.";
		} else if (!pass.equals(mem.getPass())) {
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
	 *    	로그인 상태 : main 현재 화면 출력 
	 *    	로그아웃 상태 : "로그인이 필요한 화면입니다."  메세지 출력 후 loginForm 페이지로 이동
	 */
	@RequestMapping("main") // http://localhost:8080/model2study/member/main
	public String main(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null || login.trim().equals("")) {
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
	 * 	  			아이디 전송 버튼을 클릭하면 opner 창에 id 입력란에 전달, id 화면을 닫기 
	 * 	  id 없음 : "id 가 없습니다." 현재화면 idForm 페이지로 이동
	 */
	@RequestMapping("id")
	public String idSearch(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = new MemberDao().idSearch(email, tel);
		if (id == null) {
			request.setAttribute("msg", "해당되는 아이디가 없습니다.");
			request.setAttribute("url", "idForm");
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
	 * 	  - 비밀번호 찾은 경우 : 화면에 앞 2자리는 **로 표시하여 화면에 출력. 닫기버튼 클릭시 현재 화면 닫기 
	 *    - 비밀번호 못찾은 경우 : 정보에 맞는 비밀번호를 찾을 수 없습니다. 메시지 출력 후 현재 페이지를 pwForm 이동
	 */
	@RequestMapping("pw")
	public String pwSearch(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		String pass = dao.pwSearch(id, email, tel);
		if (pass == null) {
			request.setAttribute("msg", "비밀번호를 찾을 수 없습니다.");
			request.setAttribute("url", "pwForm");
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
	 * 	  DB에서 조회 되는 경우 : 사용 중인 아이디 입니다. 빨강색 화면 출력. 등록된 아이디를 초기화 
	 * 4. 닫기 버튼 클릭되면 화면 닫기
	 */
	@RequestMapping("idchk")
	public String idchk(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Member mem = new MemberDao().selectOne(id);
		String msg = null;
		String className = null;
		if (mem == null) {
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

	/*
	 * 1. 로그인 상태 검증 로그아웃 상태 : 로그인 메세지, loginForm 이동 로그인 상태 : 다른 id 조회❌ 단 관리자는 다른 id
	 * 조회가능 내 정보만 조회 가능 메세지 출력. main 이동 2. id 파라미터 조회 3. id 에 해당하는 레코드를 조회하여
	 * Member 객체에 저장(mem) 4. info 에 Member 객체(이름이 mem) 속성으로 전달
	 */
	@RequestMapping("info")
	// @MSLogin("loginIdCheck") // info 메서드를 실행 전에 loginIdCheck 메서드 호출 → 인터셉터ㅇ
	public String info(HttpServletRequest request, HttpServletResponse response) {
		String url = loginIdCheck(request, response);
		if (url != null)
			return url;

		String id = request.getParameter("id");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/info";
	}

	/*
	 * 1. 로그인 상태 검증 - 로그아웃 : 로그인 메세지 출력. loginForm 이동 - 로그인 상태 - 다른 아이디 정보 변경
	 * 불가(관리자는 가능) → 내정보만 수정 가능. main 이동 2. id 파라미터 조회 3. DB에서 id 의 레코드를 조회.
	 * Member 객체로 리턴 4. 조회된 내용을 화면에 출력하기
	 */
	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		String url = loginIdCheck(request, response);
		if (url != null)
			return url;

		String id = request.getParameter("id");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/updateForm";
	}

//	 1. 모든 파라미터를 Member 객체에 저장하기
//	 2. 입력된 비밀번호와 DB에 저장된 비밀번호 비교.
//	 	관리자로 로그인 한 경우 관리자 비밀번호로 비교
//	 	본인 정보 수정시 본인의 비밀번호 비교
//	 	불일치 : '비밀번호 오류' 메세지 출력후 updateForm 이동
//	 3. 비밀번호 일치
//	 	Member 객체의 내용으로 DB를 수정하기 : boolean MemberDao.update(member)
//	 	 - 성공 : 회원정보 수정 완료 메시지 출력 후 info 이동
//	 	 - 실패 : 회원정보 수정 실패 메시지 출력 후 updateForm 이동
	@RequestMapping("update")
	public String update(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		String login = (String) request.getSession().getAttribute("login");
		Member dbMem = dao.selectOne(login);
		String msg = "비밀번호 오류";
		String url = "updateForm?id=" + mem.getId();
		if (mem.getPass().equals(dbMem.getPass())) {
			if (dao.update(mem)) {
				msg = "수정 성공";
				url = "info?id=" + mem.getId();
			} else {
				msg = "수정 실패";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

//	1. id 파라미터 저장
//	2. 로그인 정보 검증
//		- 로그아웃상태 : 로그인 하세요. loginForm 이동
//		- 본인탈퇴여부 검증 : 관리자를 제외하고 본인만 탈퇴 가능
//		  본인이 아닌 경우, 본인만 탈퇴 가능, main 이동
	@RequestMapping("deleteForm")
	public String deleteForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String url = loginIdCheck(request, response);
		if (url != null)
			return url;
		if (id.equals("admin")) {
			request.setAttribute("msg", "관리자는 탈퇴 할 수 없습니다.");
			request.setAttribute("url", "info?id=" + id);
			return "alert";
		}
		return "member/deleteForm";
	}

//	1. 2개의 파라미터 정보 변수 저장
//	2. 로그인 정보 검증
//		- 로그아웃 상태 : 로그인하세요. loginForm 이동
//		- 본인만 탈퇴가능(관리자 제외) : 본인만 탈퇴 가능합니다. main 이동
//		- 관리자가 탈퇴는 불가 : 관리자는 탈퇴❌. list 페이지 이동
//	3. 비밀번호 검증
//		- 로그인 정보로 비밀번호 검증.
//		- 비밀번호 불일치 : 비밀번호 오류 메세지 출력. deleteForm 이동
//	4. DB에서 id 에 해당하는 회원정보 삭제하기
//	   boolean MemberDao.delete(id)
//	   탈퇴 성공
//	   	- 일반 사용자 : 로그아웃 실행. 탈퇴 메시지 출력, loginForm 이동
//	   	- 관리자	  : 탈퇴 메시지 출력. list 이동
//	   탈퇴 실패
//	    - 일반 사용자 : 탈퇴 실패 메시지 출력. main 이동
//	    - 관리자	  : 탈퇴 실패 메시지 출력. list 이동
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String url = loginIdCheck(request, response);
		if(url != null) return url;
		if(id.equals("admin")) {
			request.setAttribute("msg", "관리자는 탈퇴할 수 없습니다.");
			request.setAttribute("url", "list");
			return "alert";
		}
		String login = (String)request.getSession().getAttribute("login");
		Member mem = dao.selectOne(login);
		if(!pass.equals(mem.getPass())) {
			request.setAttribute("msg", "비밀번호가 틀립니다");
			request.setAttribute("url", "deleteForm?id=" + id);
			return "alert";
		}
		if(login.equals("admin")) request.setAttribute("url", "list");
		if(dao.delete(id)) {
			request.setAttribute("msg", id + "회원님이 탈퇴 되었습니다.");
			if(!login.equals("admin")) {
				request.getSession().invalidate();
				request.setAttribute("url", "loginForm");
			}
		} else {
			request.setAttribute("msg", id + "회원 탈퇴 실패");
			if(!login.equals("admin")) {
				request.setAttribute("url", "main");
			}
		}
		return "alert";
	}

//	1. admin으로 로그인 된 경우만 조회 가능
//	2. db에서 모든 회원 목록을 조회하여 List<Member> 객체로 리턴
	@RequestMapping("list")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		String url = loginAdminCheck(request, response);
		if(url != null) return url;
		List<Member> list = dao.list();
		request.setAttribute("list", list);
		return "member/list";
	}
	
//	본인만 비밀번호 변경 가능 : login 정보로 비밀번호 변경하기
	@RequestMapping("cpForm")
	public String pwForm(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		}
		return "member/cpForm";
	}
	
//	1. 로그인한 사용자의 비밀번호만 변경 가능 → 로그인 상태 검증
//	     → 로그아웃인 경우 현재창 닫기. Opener의 화면을 LoginForm으로 변경하기
//	2. 파라미터 값 저장 : pass, chgpass
//	3. 로그인 정보로 회원정보를 DB에서 조회
//	4. 비밀번호 검증 : pass 파라미터와 DB에 저장된 비밀번호 비교
//		- 불일치 : 오류 메시지 출력 후 현재 페이지를 passwordForm으로 이동
//	5. 비밀번호 일치한 경우 DB의 비밀번호를 변경된 비밀번호로 변경
//		  MemberDao, updatePassword(id, 변경비밀번호)
//		- 변경 성공 : 성공 메시지 출력 후. opner 페이지를 infO로 이동. 현재페이지 닫기
//	6. 	- 변경 실패 : 오류 메시지 출력 후. 현재 페이지 닫기   
	@RequestMapping("password")
	public String password(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "openerAlert";
		}
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		Member mem = dao.selectOne(login);
		if(!pass.equals(mem.getPass())) {
			request.setAttribute("msg",  "비밀번호가 틀립니다.");
			request.setAttribute("url", "cpForm");
			return "alert";
		}
		if(dao.updatePW(login, chgpass)) {
			request.setAttribute("msg",  "비밀번호가 변경되었습니다.");
			request.setAttribute("url", "info?id=" + login);
			return "openerAlert";
		} else {
			StringBuilder sb = new StringBuilder();
			sb.append("alert('비밀번호 변경시 오류가 발생하였습니다.');\n");
			sb.append("self.close()\n");
			request.setAttribute("script", sb.toString());
			return "member/cpForm";
		}
	}
	
//	1. request 객체로 이미지 업로드 불가 -> cos.jar (request 는 이미지 형식을 못읽음)
//	2. 이미지 업로드 폴더 : 현재폴더 / picture 설정
//	3. opener 화면에 이미지 볼 수 있도록 결과 전달 => javascript
//	4. 현재 화면 close 하기 => javascript
	@RequestMapping("picture")
	public String picture(HttpServletRequest request, HttpServletResponse response) {
		// application.getRealPath("/") + "member/picture/": 업로드 파일의 위치
		// application : request.getServletContext()
		String path = request.getServletContext().getRealPath("/") + "picture/";
		String fname = null;
		File f = new File(path);
		if (!f.exists())
			f.mkdirs(); // 없으면 업로드 폴더 생성
		// 업로드 완료. 같은 이름의 이미지가 업로드 시 이름 변경 안됨. 업로드 파일의 이름 = 원본 파일의 이름이 같다.
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(
					request, // 이미지 파일 정보 저장
					path, // 업로드 파일의 위치
					10 * 1024 * 1024, // 10M. 업로드 파일의 최대 크기
					"UTF-8" // 인코딩 설정
					);
		} catch (IOException e) {
			e.printStackTrace();
		}
		fname = multi.getFilesystemName("picture"); // 파일의 이름
		request.setAttribute("fname", fname);
		return "member/picture";
	}
//==========================================================================
	
	private String loginAdminCheck(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		} else if (!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 조회 가능합니다");
			request.setAttribute("url", "main");
			return "alert";
		}
		return null;
	}

	private String loginIdCheck(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		} else if (!login.equals("admin") && !id.equals(login)) {
			request.setAttribute("msg", "본인만 조회 가능합니다");
			request.setAttribute("url", "main");
			return "alert";
		}
		return null;
	}
}