package test0306;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
	public int insert(Book book) { // mem : 화면 입력 데이터
		Connection conn = DBConnection.getConnection();
		int generateNo = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into guestbook (writer, title, content, regdate) values (?, ?, ?, now())";

		try {
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, book.getWriter());
			pstmt.setString(2, book.getTitle());
			pstmt.setString(3, book.getContent());
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				generateNo = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 정상, 오류 모두 실행되는 블럭. return 을 만나도 실행
			DBConnection.close(conn, pstmt, null);
		}
		return generateNo;
	}

	public Book view(int no) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook where no=?");
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Book book = new Book();
				book.setNo(rs.getInt("no"));
				book.setContent(rs.getString("content"));
				book.setRegdate(rs.getString("regdate"));
				book.setTitle(rs.getString("title"));
				book.setWriter(rs.getString("writer"));
				return book;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return null;
	}

	public void update(Book book) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update guestbook set content=?, title=?, writer=? where no=?");
			pstmt.setString(1, book.getContent());
			pstmt.setString(2, book.getTitle());
			pstmt.setString(3, book.getWriter());
			pstmt.setInt(4, book.getNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}

	public List<Book> list() {
		List<Book> books = new ArrayList<>();
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook order by no desc");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book();
				book.setNo(rs.getInt("no"));
				book.setWriter(rs.getString("writer"));
				book.setTitle(rs.getString("title"));
				book.setContent(rs.getString("content"));
				book.setRegdate(rs.getString("regdate"));
				books.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return books;
	}
}
