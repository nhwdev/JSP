package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	private final Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public boolean insert(Member mem) { // mem : 화면 입력 데이터
		SqlSession session = DBConnection.getConnection();
		try {
			if (session.getMapper(cls).insert(mem) > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 정상, 오류 모두 실행되는 블럭. return 을 만나도 실행
			DBConnection.close(session);
		}
		return false;
	}

	public Member selectOne(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean update(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			if (session.getMapper(cls).update(mem) > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public List<Member> list() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).selectList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean delete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public String idSearch(String email, String tel) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("email", email);
			map.put("tel", tel);
			return session.getMapper(cls).idSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public String pwSearch(String id, String email, String tel) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).pwSearch(id,email,tel);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean updatePW(String id, String pass) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).updatePW(id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
}
