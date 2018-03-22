package top.sadboy.shopping.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import top.sadboy.shopping.Category;
import top.sadboy.shopping.Product;
import top.sadboy.shopping.util.DB;

public class ProductMySqlDAO implements ProductDAO {
	int pageCount = 0;

	public List<Product> getProducts() {
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product";
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}

	// 实现分页功能
	public List<Product> getProducts(int pageNo, int pageSize) {
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product limit " + (pageNo - 1) * pageSize + "," + pageSize;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}

	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		String sql = "select product.id, product.name, product.descr, product.normalprice, product.memberprice, product.pdate, product.categoryid, "
				+ " category.id cid, category.name cname, category.descr cdescr, category.pid, category.isleaf, category.grade "
				+ "from product join category on (product.categoryid = category.id) limit " + (pageNo - 1) * pageSize
				+ "," + pageSize;
		System.out.println(sql);
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			rsCount = DB.executeQuery(conn, "select count(*) from product");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				
				Category c = new Category();
				c.setId(rs.getInt("cid"));
				c.setName(rs.getString("cname"));
				c.setDescr(rs.getString("cdescr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
				p.setCategory(c);
				
				products.add(p);
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

	public boolean updateProduct(Product p) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update product set name = ?, descr = ?, normalprice = ?, memberprice = ?, pdate = ?, categoryid = ?"
				+ " where id = " + p.getId();
		try {
			conn = DB.getConn();
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormalPrice());
			pstmt.setDouble(4, p.getMemberPrice());
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(6, p.getCategoryId());
			System.out.println("update:"+sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DB.closePstmt(pstmt);
			DB.closeConn(conn);
		}
		return true;
	}

	// 一下删除多个product或者一个
	public boolean deleteProductById(int id) {
		return false;
	}

	public boolean deleteProductById(int[] idArray) {
		return false;
	}

	public boolean deleteProductByCategoryId(int categoryId) {
		return false;
	}

	public boolean addProduct(Product p) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into product values (null, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DB.getConn();
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormalPrice());
			pstmt.setDouble(4, p.getMemberPrice());
			pstmt.setTimestamp(5, p.getPdate());
			pstmt.setInt(6, p.getCategoryId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DB.closePstmt(pstmt);
			DB.closeConn(conn);
		}
		return true;
		// 这里如catch到任何exception的时候，直接return false，只有代码一直执行到最后，一定就是true了
	}

	public int findProducts(List<Product> list, int[] categoryId, String keyWord, double lowMemberPrice,
			double highMemberPrice, double lowNormalPrice, double highNormalPrice, Timestamp startDate,
			Timestamp endDate, int pageNo, int pageSize) {
		return 0;
	}

	@Override
	public int findProducts(List<Product> list, int[] categoryId, String keyWord, double lowMemberPrice,
			double highMemberPrice, double lowNormalPrice, double highNormalPrice, Date startDate,
			Date endDate, int pageNo, int pageSize) {
		int pageCount = 0;
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		String strId = "";
		String sqlCount = "";
		String sql = "select * from product where 1 = 1 ";
		if (categoryId != null && categoryId.length > 0) {
			strId += "(";
			for (int i = 0; i < categoryId.length; i++) {
				if (i < categoryId.length - 1) {
					strId += categoryId[i] + ",";
				} else {
					strId += categoryId[i];
				}
			}
			strId += ")";
			sql += " and categoryid in " + strId;
		}

		// 提供对name和describ的模糊查询，sql语句中用like 并且用%%标注
		if (keyWord != null && !keyWord.trim().equals("")) {
			sql += " and name like '%" + keyWord + "%' or descr like '%" + keyWord + "%'";
		}

		if (lowMemberPrice >= 0) {
			sql += " and memberprice >= " + lowMemberPrice;
		}

		if (highMemberPrice > 0) {
			sql += " and memberprice <= " + highMemberPrice;
		}

		if (lowNormalPrice >= 0) {
			sql += " and normalprice >= " + lowNormalPrice;
		}

		if (highNormalPrice > 0) {
			sql += " and normalprice <= " + highNormalPrice;
		}

		if (startDate != null) {
			sql += " and pdate >= ' " + new SimpleDateFormat("yyyy-MM-dd").format(startDate) + " ' ";
		}

		if (endDate != null) {
			sql += " and pdate <= ' " + new SimpleDateFormat("yyyy-MM-dd").format(endDate) + " ' ";
		}

		sqlCount = sql.replaceFirst("\\* ", "count(*) ");
		sql += " limit " + (pageNo - 1) * pageSize + "," + pageSize;

		System.out.println(sql);
		System.out.println(sqlCount);
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			rsCount = DB.executeQuery(conn, sqlCount);
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return pageCount;
	}

	public Product loadById(int id) {
		Product p = new Product();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product where id = " + id;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			if (rs.next()) {
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return p;
	}


	// 咱从数据库里按pdate拿出最新的_count_个products
	public List<Product> getLatestProducts(int count) {
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product order by pdate desc limit 0 ," + count;
		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}

	public List<Product> getRecommendedProducts(int count) {
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from product where categoryid = 26 order by pdate desc limit 0 ," + count;
		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}

}
