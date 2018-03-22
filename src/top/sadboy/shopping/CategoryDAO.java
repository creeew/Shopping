package top.sadboy.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import top.sadboy.shopping.util.DB;

public class CategoryDAO {
	public static void save(Category c) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			if (c.getId() == -1) {
				sql = "insert into category values (null, ?, ?, ?, ?, ?)";
			} else {
				sql = "insert into category values ("+ c.getId() +", ?, ?, ?, ?, ?)";
			}
			conn = DB.getConn();
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setInt(3, c.getPid());
			pstmt.setInt(4, c.isLeaf() ? 0 : 1);
			pstmt.setInt(5, c.getGrade());
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	public static void addChildCategory(int pid, String name, String descr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into category values (null, ?, ?, ?, ?, ?)";
		try {
			int parentGrade = 0;
			conn = DB.getConn();
			conn.setAutoCommit(false);
			rs = DB.executeQuery(conn, "select * from category where id = " + pid);
			if (rs.next()) {
				parentGrade = rs.getInt("grade");
			}
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, pid);
			pstmt.setInt(4, 0);
			pstmt.setInt(5, parentGrade+1);
			pstmt.executeUpdate(); 
			if (pid != 0) {
				DB.executeUpdate(conn, "update category set isleaf = 1 where id = " + pid);
			}
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	public static void getCategories(List<Category> list, int id) {
		Connection conn = null;
		
		try {
			conn = DB.getConn();
			getCategories(conn, list, id);
		} finally {
			DB.closeConn(conn);
		}
	}
	
	private static void getCategories(Connection conn, List<Category> list, int id) {
		ResultSet rs = null;
		
		//这里是把传来的id中，他的子目录全部存到rs中
		String sql = "select * from category where pid = "+ id;
		
		try {
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if (!c.isLeaf()) {
					getCategories(list, c.getId());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
		}
	}

	public static Category loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Category c = null;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, "select * from category where id = " + id);
			if (rs.next()) {
				c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return c;
	}

	public static void del(int id) {
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, "select * from category where pid = " + id);
			while (rs.next()) {
				del(rs.getInt("id"));
			}
			conn.createStatement().executeUpdate("delete from category where id = " + id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
	}

	public static void judgeLeaf(int id, int pid) {
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			conn.setAutoCommit(false);
			del(id);
			rs = DB.executeQuery(conn, "select count(*) from category where pid = " + id);
			rs.next();
			int count = rs.getInt(1);
			if (count < 1) {
				conn.createStatement().executeUpdate("update category set isleaf = 0 where id = " + pid);
			}
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
	}
}
