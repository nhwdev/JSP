package model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBConnection {
	private DBConnection() {}
	private static SqlSessionFactory sqlMap;
	static {
		String resource = "model/mapper/mybatis-config.xml";
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream(resource);
		} catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static SqlSession getConnection() {
		return sqlMap.openSession();
	}
	public static void close(SqlSession session) {
		session.commit();
		session.close();
	}

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
