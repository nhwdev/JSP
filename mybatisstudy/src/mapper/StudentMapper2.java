package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import main.Student;

public interface StudentMapper2 {

	@Insert("insert into student (studno, name, jumin, id) values(#{studno}, #{name}, #{jumin}, #{id})")
	int insert(Student st);

	@Select("select * from student where name=#{name}")
	Student selectName(String string);

	@Update("update student set grade=#{grade}, weight=#{weight}, height=#{height} where name=#{name}")
	int update(Student st);

	@Delete("delete from student where name=#{value}")
	int deletName(String string);

}
