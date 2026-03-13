package main;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main2 {
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
		System.out.println("학생 테이블에 레코드 추가하기");
		Student st = new Student();
		st.setStudno(1002);
		st.setName("김삿갓");
		st.setGrade(1);
		st.setId("kimsk");
		st.setJumin("9901031234567");
		st.setMajor1(101);
		int cnt = session.insert("student.insert", st); // 변경된 레코드 갯수 리턴
		System.out.println("student 테이블에 레코드 추가 : " + cnt);
		Student stResult = session.selectOne("student.selectNo", st.getStudno());
		System.out.println(stResult);
		System.out.println("1002번 학생의 학년을 2학년, 몸무게:80, 키:170, 지도교수:1001 수정하기");
		st.setStudno(1002);
		st.setGrade(2);
		st.setWeight(80);
		st.setHeight(170);
		st.setProfno(1001);
		cnt = session.update("student.update", st);
		System.out.println("수정된 레코드 갯수 : " + cnt);
		stResult = session.selectOne("student.selectNo",st.getStudno());
		System.out.println(stResult);
		System.out.println("1002번 학생의 정보를 삭제하기");
		cnt = session.delete("student.delete", st.getStudno());
		System.out.println("삭제된 레코드 갯수 : " + cnt);
		stResult = session.selectOne("student.selectNo",st.getStudno());
		System.out.println(stResult);
		// 자동 rollback 됨. commit❌
		// session.commit();❌
	}
}
