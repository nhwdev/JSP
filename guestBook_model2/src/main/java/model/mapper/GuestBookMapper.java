package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Book;

public interface GuestBookMapper {
	@Insert("INSERT INTO guestbook (writer, title, content, regdate) VALUES (#{writer}, #{title}, #{content}, now())")
	@Options(useGeneratedKeys = true, keyProperty = "no") // 기본키의 AUTO_INCREMENT 값 반환
	void insert(Book book);

	@Select("SELECT * FROM guestbook WHERE no=#{no}")
	Book view(int no);

	@Update("UPDATE guestbook SET content=#{content}, title=#{title}, writer=#{writer} where no=#{no}")
	void update(Book book);

	@Select("SELECT * FROM guestbook ORDER BY no DESC")
	List<Book> list();

	@Delete("DELETE FROM guestbook WHERE no=#{no}")
	void delete(String no);
}
