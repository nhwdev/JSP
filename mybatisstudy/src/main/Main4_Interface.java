package main;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.StudentMapper;

public class Main4_Interface {
	private final static SqlSessionFactory sqlMap;
	private final static Class<StudentMapper> cls = StudentMapper.class;
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
		System.out.println("모든 학생 정보");
		List<Student> list = session.getMapper(cls).select();
		for (Student s : list)
			System.out.println(s);

//			System.out.println("1학년 학생 정보");
//			list = session.getMapper(cls).select();
//			for(Student s : list) System.out.println(s);

		System.out.println("1002번 학생 정보");
		Student st = session.getMapper(cls).selectStudno("1002");
		System.out.println(st);

		System.out.println("모든 학생 정보 - xml 방식 호출");
		list = session.selectList("mapper.StudentMapper.select");
		for (Student s : list)
			System.out.println(s);

		// Map 객체 이용
		System.out.println("1학년 학생 중 키가 180이상인 학생의 정보");
		Map<String, Object> map = new HashMap<>();
		map.put("grade", 1);
		map.put("height", 180);
		list = session.getMapper(cls).selectGradeHeight1(map);
		for (Student s : list)
			System.out.println(s);
		System.out.println("1학년 학생 중 키가 180이상인 학생의 정보");
		list = session.getMapper(cls).selectGradeHeight2(1, 180);
		for (Student s : list)
			System.out.println(s);
	}
}
