package test0305;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookDao {
	public void insert(Book book) { // mem : 화면 입력 데이터
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into guestbook (writer, title, content, regdate) values (?, ?, ?, now())";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getWriter());
			pstmt.setString(2, book.getTitle());
			pstmt.setString(3, book.getContent());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally { // 정상, 오류 모두 실행되는 블럭. return 을 만나도 실행 
			DBConnection.close(conn, pstmt, null);
		}
	}
	
}
