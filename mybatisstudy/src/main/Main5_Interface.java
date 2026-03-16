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
import mapper.StudentMapper2;

public class Main5_Interface {

	private final static SqlSessionFactory sqlMap;
	private final static Class<StudentMapper2> cls = StudentMapper2.class;
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
		System.out.println("이몽룡 학생 추가하기");
		Student st = new Student();
		st.setStudno(1001);
		st.setName("이몽룡");
		st.setJumin("9803051234567");
		st.setId("leemy97");
		int cnt = session.getMapper(cls).insert(st);
		System.out.println("이몽룡 학생 추가 건수 : " + cnt);
		Student stResult = session.getMapper(cls).selectName("이몽룡");
		System.out.println(stResult);
		
		System.out.println("이몽룡 학생의 학년:1, 몸무게:80, 키175로 수정");
		st.setGrade(1);
		st.setWeight(80);
		st.setHeight(175);
		cnt = session.getMapper(cls).update(st);
		stResult = session.getMapper(cls).selectName("이몽룡");
		System.out.println(stResult);
		
		System.out.println("이몽룡 학생의 정보 삭제하기");
		cnt = session.getMapper(cls).deletName("이몽룡");
		System.out.println("이몽룡 학생 정보 삭제 건수 : " + cnt);
		stResult = session.getMapper(cls).selectName("이몽룡");
		System.out.println(stResult);
	}
}
