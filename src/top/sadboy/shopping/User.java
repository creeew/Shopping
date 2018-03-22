package top.sadboy.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import top.sadboy.shopping.util.DB;

public class User {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Timestamp rdate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Timestamp getRdate() {
		return rdate;
	}

	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	
	public void save() {
		Connection conn = null;
		String sql = "insert into ruser values(null, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			pstmt.setTimestamp(5, rdate);
//			pstmt.setTimestamp(5, new Timestamp(rdate.getTime()));
			pstmt.executeUpdate(); // yo,bro CANNOT FORGET THIS STEP
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	public void update() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update ruser set username = ?, phone = ?, addr = ? where id = " + this.id;
		System.out.println(sql);
		try {
			conn = DB.getConn();
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			pstmt.setString(3, addr);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closePstmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	public void changePwd() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update ruser set password = ? where id = " + this.id;
		try {
			conn = DB.getConn();
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, password);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closePstmt(pstmt);
			DB.closeConn(conn);
		}
		
	}

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
//				u.setRdate(new Timestamp(rs.getDate("rdate").getTime()));
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
	
	public static void delUser(int id) {
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
	
	public static boolean userExists(String username, String password) {
		boolean b = false;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, "select * from ruser where username = '"+ username +"' and password = '"+ password +"'");
			b = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return b;
	}
	
	public static User validate(String username, String password) throws UserNotFoundException, PasswordNotCorrectException {
		Connection conn = null;
		ResultSet rs = null;
		User u = null;
		String sql = "select * from ruser where username = '"+ username +"' and password = '"+ password +"'";
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			if (!rs.next()) {
				throw new UserNotFoundException();
			} else if (!rs.getString("password").equals(password)) {
				throw new PasswordNotCorrectException();
			} else {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return u;
	}
	
}
