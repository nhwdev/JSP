package mapper;

import main.Student;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface StudentMapper {
	@Select("select * from student")
	List<Student> select();

//	@Select("select * from student where grade=#{value}") → 인터페이스 내에 같은 이름을 가진 메서드는 존재 할 수 없음.d
//	List<Student> select(int i);

	@Select("select * from student where studno=#{value}")
	Student selectStudno(String string);

	@Select("select * from student where grade=#{grade} and height>=#{height}")
	List<Student> selectGradeHeight1(Map<String, Object> map);
	
	@Select("select * from student where grade=#{grade} and height>=#{height}")
	List<Student> selectGradeHeight2(@Param("grade")int i, @Param("height") int j);
}
