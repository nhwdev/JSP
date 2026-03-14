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

import main.Student;

/*
 * StudentMapper1.xml 또는 StudentMapper2.xml 이용해도 좋음 
 * 또는 StudentMapper3.xml 파일을 생성해도 됨
 * 1. 학생 테이블의 등록된 레코드의 건수를 출력하기
 * 2. 학생 테이블의 등록된 레코드의 정보를 출력하기
 * 3. 학생 테이블의 등록된 레코드의 1학년 학생의 정보를 출력하기
 * 4. 학생 테이블의 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기
 * 5. 학생 테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보를 출력하기
 */

public class Test1 {
	private final static SqlSessionFactory sqlMap;
	static { // static 초기화 블록 : static 변수의 초기화 담당
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
		// 1. 학생 테이블의 등록된 레코드의 건수를 출력하기
		System.out.println("1. 학생 테이블의 등록된 레코드 수: " + session.selectOne("test0313.Test1.1"));
		// 2. 학생 테이블의 등록된 레코드의 정보를 출력하기
		List<Student> list = session.selectList("test0313.Test1.2");
		System.out.println("2. 학생 테이블의 등록된 레코드의 정보 : ");
		for (Student s : list)
			System.out.println(s);
		// 3. 학생 테이블의 등록된 레코드의 1학년 학생의 정보를 출력하기
		list = session.selectList("test0313.Test1.3", "1");
		System.out.println("3. 학생 테이블의 등록된 레코드의 1학년 학생 정보 : ");
		for (Student s : list) {
			System.out.println(s);
		}
		// 4. 학생 테이블의 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기
		list = session.selectList("test0313.Test1.4", "김");
		System.out.println("4. 학생 테이블의 등록된 레코드의 성이 김씨인 학생 정보 : ");
		for (Student s : list) {
			System.out.println(s);
		}
		// 5. 학생 테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보를 출력하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grade", "3");
		map.put("jumin", "2");
		list = session.selectList("test0313.Test1.5", map);
		System.out.println("5. 학생 테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보 : ");
		for (Student s : list) {
			System.out.println(s);
		}
	}
}
