package test0313;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import main.Professor;

/*
 * ProfessorMapper.xml 파일을 이용하기
 * Professor.java 파일 이용하기
1. 교수 테이블에 등록된 레코드의 건수를 출력하기
2. 교수 테이블에 등록된 모든 정보를 출력하기
3. 교수 중 101번 학과의 교수 정보를 출력하기
4. 교수 중 성이 김씨인 시간강사 정보를 출력하기 
*/
public class Test2 {
	private final static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}

	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		// 1. 교수테이블에 등록된 레코드의 건수를 출력하기.
		System.out.println("1. 교수 테이블에 등록된 레코드의 건수 : " + session.selectOne("test0313.Test2.1"));
		// 2. 교수 테이블에 등록된 모든 정보를 출력하기
		List<Professor> list = session.selectList("test0313.Test2.2");
		System.out.println("2. 교수 테이블에 등록된 모든 정보 : ");
		for (Professor p : list)
			System.out.println(p);
		// 3. 교수 중 101번 학과의 교수 정보를 출력하기
		list = session.selectList("test0313.Test2.3", 101);
		System.out.println("3. 교수 중 101번 학과의 교수 정보 : ");
		for (Professor p : list)
			System.out.println(p);
		// 4. 교수 중 성이 김씨인 시간강사 정보를 출력하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "김");
		map.put("position", "시간강사");
		list = session.selectList("test0313.Test2.4", map);
		System.out.println("4. 교수 중 성이 김씨인 시간강사 정보 : ");
		for (Professor p : list)
			System.out.println(p);
	}
}
