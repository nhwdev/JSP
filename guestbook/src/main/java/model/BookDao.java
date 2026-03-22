package model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import model.mapper.GuestBookMapper;

public class BookDao {
	private final Class<GuestBookMapper> cls = GuestBookMapper.class;

	public int insert(Book book) {
		SqlSession session = DBConnection.getConnection();

		try {
			session.getMapper(cls).insert(book);
			return book.getNo();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public Book view(int no) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).view(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public void update(Book book) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(cls).update(book);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}

	public List<Book> list() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public void delete(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(cls).delete(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}
}
