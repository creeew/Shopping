package top.sadboy.shopping;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import top.sadboy.shopping.util.*;

public class TestUpdate {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update product set name = ? where categoryid = 26";
		try {
			conn = DB.getConn();
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, "haha");
			pstmt.executeUpdate();
			System.out.println("update :"+sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closePstmt(pstmt);
			DB.closeConn(conn);
		}
	}
}
