package top.sadboy.shopping;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import top.sadboy.shopping.util.DB;


public class UserManager {
	public static List<User> getUsers() {
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from ruser order by id desc";
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}
	
	public static void deleteUser(int id) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			stmt.executeUpdate("delete from ruser where id = "+id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
	}
}
