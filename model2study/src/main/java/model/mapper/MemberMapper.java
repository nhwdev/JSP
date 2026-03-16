package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Delete;

import model.Member;

/*
 * 인터페이스 방식으로 Mapper 사용하기
 * 1. mybatis-config.xml의 <mapper package="인텊에ㅣ스가 존재하는 패키지명"> 태그에 package 로 설정
 * 2. namespace 속성 : 패키지명.인터페이스명 model.mapper.MemberMapper
 * 3. 메서드의 이름이 xml에서의 id 속성값. 오버로딩을 하면 안됨 → 매퍼 인터페이스는 오버로딩 불가
 * 4. < : 동적태그에서 사용시 작다 표현은 &lt; 으로 표현한다.→
 */
public interface MemberMapper {

	@Insert("insert into member (id, pass, name, gender, tel, email, picture) values (#{id}, #{pass}, #{name}, #{gender}, #{tel}, #{email}, #{picture})")
	int insert(Member mem);

	@Select("select * from member where binary id=#{value}")
	Member selectOne(String id);

	@Update("update member set name=#{name}, gender=#{gender}, tel=#{tel}, email=#{email}, picture=#{picture} WHERE binary id=#{id}")
	int update(Member mem);

	@Select("select * from member")
	List<Member> selectList();

	@Delete("delete from member where binary id=#{id}")
	int delete(String id);

	@Select("select id from member where email=#{email} and tel=#{tel}")
	String idSearch(Map<String, Object> map);

	@Select("select pass from member where binary id=#{id} and email=#{email} and tel=#{tel}")
	String pwSearch(@Param("id") String id, @Param("email") String email, @Param("tel") String tel);

	@Update("update member set pass=#{pass} where id=#{id}")
	boolean updatePW(@Param("id") String id, @Param("pass") String pass);
}