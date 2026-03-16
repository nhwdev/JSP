package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import main.Student;

public interface StudentMapper3 {
	String sql = "select * from student";

	@Select({ "<script>", 
				sql, 
				"<where>", 
					"<if test='grade != null'>grade=#{grade}</if>",
					"<if test='height != null'>height&gt;=#{height}</if>",
					"<if test='weight != null'>weight&lt;=#{weight}</if>",
				"</where>",
			"</script>" })
	List<Student> select(Map<String, Object> map);

	@Select({ "<script>",
				sql,
					"<trim prefix='where' prefixOverrides='AND'>",
					"<if test='grade != null'>and grade=#{grade}</if>",
						"<if test='height != null'>and height&gt;=#{height}</if>",
					"</trim>",
				"</script>"})
	List<Student> select2(Map<String, Object> map);
}
