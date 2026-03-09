package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	public boolean insert(Member mem) { // mem : 화면 입력 데이터
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member (id, pass, name, gender, tel, email, picture) values (?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPass());
			pstmt.setString(3, mem.getName());
			pstmt.setInt(4, mem.getGender());
			pstmt.setString(5, mem.getTel());
			pstmt.setString(6, mem.getEmail());
			pstmt.setString(7, mem.getPicture());
			// executeUpdate() : 변경된 레코드 갯수 리턴
			if (pstmt.executeUpdate() > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 정상, 오류 모두 실행되는 블럭. return 을 만나도 실행
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}

	public Member selectOne(String id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select * from member where binary id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}

	public boolean update(Member mem) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set name=?, gender=?, tel=?, email=?, picture=? WHERE binary id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getName());
			pstmt.setInt(2, mem.getGender());
			pstmt.setString(3, mem.getTel());
			pstmt.setString(4, mem.getEmail());
			pstmt.setString(5, mem.getPicture());
			pstmt.setString(6, mem.getId());
			if (pstmt.executeUpdate() > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}

	public List<Member> list() {
		List<Member> members = new ArrayList<Member>();
		Connection conn = DBConnection.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				members.add(mem);
			}
			return members;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}

	public boolean delete(String id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from member where binary id=?");
			pstmt.setString(1, id);
			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}

	public String idSearch(String email, String tel) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select id from member where email=? and tel =?");
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}

	public String pwSearch(String id, String email, String tel) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select pass from member where binary id=? and email=? and tel =?");
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("pass");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	
}
