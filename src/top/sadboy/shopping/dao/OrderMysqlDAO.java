package top.sadboy.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import top.sadboy.shopping.Cart;
import top.sadboy.shopping.CartItem;
import top.sadboy.shopping.Product;
import top.sadboy.shopping.SalesItem;
import top.sadboy.shopping.SalesOrder;
import top.sadboy.shopping.User;
import top.sadboy.shopping.util.DB;

public class OrderMysqlDAO {

	// 数据库中有两个表，其中一个salesorder是用来存储订单，salesitem用来记录出售的商品
	public void saveOrder(SalesOrder so) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rsKey = null;
		String sql = "insert into salesorder values (null, ?, ?, ?, ?)";
		try {
			conn = DB.getConn();
			conn.setAutoCommit(false);
			// 这里的true用来接收generatedKey
			pstmt = DB.getPstmt(conn, sql, true);
			pstmt.setInt(1, so.getUser().getId());
			pstmt.setString(2, so.getAddr());
			pstmt.setTimestamp(3, so.getoDate());
			pstmt.setInt(4, so.getStatus());
			pstmt.executeUpdate();
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			int key = rsKey.getInt(1);

			String sqlItem = "insert into salesitem values (null, ?, ?, ?, ?)";
			pstmt1 = DB.getPstmt(conn, sqlItem);
			Cart c = so.getCart();
			List<CartItem> items = c.getItems();
			for (int i = 0; i < items.size(); i++) {
				CartItem ci = items.get(i);
				pstmt1.setInt(1, ci.getProductId());
				pstmt1.setDouble(2, ci.getPrice());
				pstmt1.setInt(3, ci.getCount());
				pstmt1.setInt(4, key);
				pstmt1.addBatch();
			}
			pstmt1.executeBatch();
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.setAutoCommit(true);
				conn.rollback();
			} catch (SQLException e1) {
			}
		} finally {
			DB.closeRs(rsKey);
			DB.closePstmt(pstmt1);
			DB.closePstmt(pstmt);
			DB.closeConn(conn);
		}
	}

	public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = -1;
		// 会有用户不注册购买的情况，这样userid就为-1了，而ruser表中无id为-1的数据项，所以用左连接，即没有匹配项，还是会显示Null
		String sql = "select salesorder.id, salesorder.userid, salesorder.addr, salesorder.odate, salesorder.status,"
				+ " ruser.id uid, ruser.username, ruser.password, ruser.phone, ruser.addr uaddr, ruser.rdate "
				+ "from salesorder left join ruser on (salesorder.userid = ruser.id) limit " + (pageNo - 1) * pageSize
				+ "," + pageSize;
System.out.println(sql);
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			rsCount = DB.executeQuery(conn, "select count(*) from salesorder");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;

			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("uaddr"));
				u.setRdate(rs.getTimestamp("rdate"));
				
				SalesOrder so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setUser(u);
				so.setAddr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				
				orders.add(so);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rsCount);
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return pageCount;
	}

	public SalesOrder loadById(int id) {
		SalesOrder so = new SalesOrder();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select salesorder.id, salesorder.userid, salesorder.addr, salesorder.odate, salesorder.status,"
				+ " ruser.id uid, ruser.username, ruser.password, ruser.phone, ruser.addr uaddr, ruser.rdate "
				+ "from salesorder left join ruser on (salesorder.userid = ruser.id) where salesorder.id = " + id;
System.out.println(sql);
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("uaddr"));
				u.setRdate(rs.getTimestamp("rdate"));
				
				so.setId(rs.getInt("id"));
				so.setUser(u);
				so.setAddr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return so;
	}

	public List<SalesItem> getSalesItems(SalesOrder salesOrder) {
		Connection conn = null;
		ResultSet rs = null;
		List<SalesItem> items = new ArrayList<SalesItem>();
		String sql = "select salesitem.id, salesitem.productid, salesitem.unitprice, salesitem.pcount, salesitem.orderid, "
				+ "product.id pid, product.name, product.descr, product.normalprice, product.memberprice, "
				+ "product.pdate, product.categoryid from salesitem join product on (salesitem.productid = product.id) "
				+ "where salesitem.orderid = " + salesOrder.getId();
System.out.println(sql);		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("pid"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				
				// 每次都要new个新的salesitem出来啊，因为这里存的是list
				SalesItem si = new SalesItem();
				si.setId(rs.getInt("id"));
				si.setProduct(p);
				si.setUnitprice(rs.getDouble("unitprice"));
				si.setCount(rs.getInt("pcount"));
				si.setOrder(salesOrder);
				items.add(si);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return items;
	}

	public void updateStatus(SalesOrder so) {
		Connection conn = null;
		String sql = "update salesorder set status = " + so.getStatus() + " where id = " + so.getId();
		System.out.println(sql);
		try {
			conn = DB.getConn();
			conn.createStatement().executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeConn(conn);
		}
	}
	
	

}
