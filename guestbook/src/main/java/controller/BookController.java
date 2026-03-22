package controller;

import java.util.List;

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
		return "redirect:bookInfo?no=" + dao.insert(book);
	}

	@RequestMapping("bookInfo")
	public String bookInfo(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		Book book = dao.view(Integer.parseInt(no));
		request.setAttribute("book", book);
		return "bookInfo";
	}

	@RequestMapping("bookList")
	public String bookList(HttpServletRequest request, HttpServletResponse response) {
		List<Book> books = dao.list();
		request.setAttribute("books", books);
		return "bookList";
	}

	@RequestMapping("bookDelete")
	public String bookDelete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		dao.delete(no);
		return "redirect:bookList";
	}

	@RequestMapping("bookUpdateForm")
	public String bookUpdateForm(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		Book book = dao.view(Integer.parseInt(no));
		request.setAttribute("book", book);
		return "bookUpdateForm";
	}

	@RequestMapping("bookUpdate")
	public String bookUpdate(HttpServletRequest request, HttpServletResponse response) {
		Book book = new Book();
		book.setContent(request.getParameter("content"));
		book.setTitle(request.getParameter("title"));
		book.setWriter(request.getParameter("writer"));
		book.setNo(Integer.parseInt(request.getParameter("no")));
		dao.update(book);
		return "redirect:bookInfo?no=" + request.getParameter("no");
	}
}
