package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Book;
import model.BookDao;

@WebServlet(urlPatterns = { "/book/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class BookController extends MskimRequestMapping {
	BookDao dao = new BookDao();

	@RequestMapping("guestBook")
	public String guestBook(HttpServletRequest response, HttpServletResponse request) {
		return "guestBook";
	}
	
	@RequestMapping("bookWrite")
	public String bookWrite(HttpServletRequest request, HttpServletResponse response) {
		
		Book book = new Book();
		book.setWriter(request.getParameter("writer"));
		book.setTitle(request.getParameter("title"));
		book.setContent(request.getParameter("content"));
		BookDao dao = new BookDao();
		int no = dao.insert(book);
		request.setAttribute("book",book);
		return "bookInfo";
	}

}
