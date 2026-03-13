package main;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * Mybatis 이전에 사용하던 프레임워크
 */
public class Main1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			// mybatis-config.xml 파일을 읽기
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			// sqlMap : sql 구문들을 저장. id 속성값으로 SQL 구문을 저장. id 속성값은 중복❌❌
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Mybatis 설정 성공");
		int x = 0;
		// session : myBatis 에서 사용되는 연결객체(Connection 객체
		SqlSession session = sqlMap.openSession();
		// selectOne(id 속성값) : 조회되는 레코드가 한개인 경우 호출되는 메서드
		x = (Integer) session.selectOne("member.count");
		System.out.println("member 테이블의 레코드 갯수 : " + x + "\n");

		System.out.println("===member 테이블에 전체 레코드 조회하기===");
		List<Member> list = session.selectList("member.list");
		for (Member m : list) {
			System.out.println(m);
		}
		System.out.println("\n=== member 테이블에서 id가 admin인 레코드 조회하기 ===");
		Member mem = session.selectOne("member.selectid", "admin");
		System.out.println(mem);
		System.out.println("\n=== member 테이블에서 이름이 '1'을 포함한 레코드 조회하기 ===");
		list = session.selectList("member.selectname", "1");
		for (Member m : list) {
			System.out.println(m);
		}
		System.out.println("\n=== member 테이블에서 id가 'a'을 포함한 레코드 조회하기 ===");
		list = session.selectList("member.selectid2", "%a%");
		for (Member m : list) {
			System.out.println(m);
		}
		System.out.println("\n=== member 테이블에서 이름에 테스트를 포함한 레코드 중 성별이 여자인 레코드 조회하기 ===");
		Map<String, Object> map = new HashMap<>();
		map.put("name", "1");
		map.put("gender", "1");
		list = session.selectList("member.selectname2", map);
		for(Member m : list) {
			System.out.println(m);
		}
	}
}