package top.sadboy.shopping;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

import top.sadboy.shopping.dao.ProductDAO;
import top.sadboy.shopping.dao.ProductMySqlDAO;

/**
 * 
 * @author OldDaddy
 * 真是神了，用了ProductDAO接口，我只要在static中指定我用的是哪种数据库类型DAO就可以了，
 * 如果换了数据，就只需要修改一点配置就好了
 *
 */
public class ProductMrg {
	
	private static ProductMrg pm = null;
	
	ProductDAO dao;
	
	private ProductMrg() {
	}
	
	static {
		if (pm == null) {
			pm = new ProductMrg();
			pm.setDAO(new ProductMySqlDAO());
		}
	}
	
	// 这里给大家提供一个可以返回pm类的单例方法
	public static ProductMrg getInstance() {
		return pm;
	}
	
	public ProductDAO getDAO() {
		return dao;
	}
	
	public void setDAO(ProductDAO dao) {
		this.dao = dao;
	}

	public List<Product> getProducts() {
		return dao.getProducts();
	}

	// 实现分页功能
	public List<Product> getProducts(int pageNo, int pageSize) {
		return dao.getProducts(pageNo, pageSize);
	}
	
	// 获得product表中一共多少条记录（用来分页）
	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		return dao.getProducts(products, pageNo, pageSize);
	}

	// 根据传入字段来查询product 这里应该对传入进来的参数进行检测，其实前台也应该检查
	public int findProducts(List<Product> list, int[] categoryId, String keyWord, double lowMemberPrice,
			double highMemberPrice, double lowNormalPrice, double highNormalPrice, Date startDate, Date endDate,
			int pageNo, int pageSize) {
		return dao.findProducts(list, categoryId, keyWord, lowMemberPrice, highMemberPrice, lowNormalPrice, highNormalPrice, startDate, endDate, pageNo, pageSize);
	}

	public boolean updateProduct(Product p) {
		return dao.updateProduct(p);
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
		return dao.addProduct(p);
	}
	
	public Product loadById(int id) {
		return dao.loadById(id);
	}
	
	public List<Product> getLatestProducts(int count) {
		return dao.getLatestProducts(count);
	}
	
	public List<Product> getRecommendedProducts(int count) {
		return dao.getRecommendedProducts(count);
	}
}
