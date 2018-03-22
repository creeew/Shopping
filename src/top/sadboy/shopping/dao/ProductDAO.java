package top.sadboy.shopping.dao;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

import top.sadboy.shopping.Product;

public interface ProductDAO {
	public List<Product> getProducts();

	// 实现分页功能
	public List<Product> getProducts(int pageNo, int pageSize);

	public boolean updateProduct(Product p);

	// 一下删除多个product或者一个
	public boolean deleteProductById(int id);
	
	public boolean deleteProductById(int[] idArray);
	
	public boolean deleteProductByCategoryId(int categoryId);
	
	public boolean addProduct(Product p);

	public int getProducts(List<Product> products, int pageNo, int pageSize);
	
	public int findProducts(List<Product> list, int[] categoryId, String keyWord, double lowMemberPrice,
			double highMemberPrice, double lowNormalPrice, double highNormalPrice, Timestamp startDate, Timestamp endDate,
			int pageNo, int pageSize);

	public int findProducts(List<Product> list, int[] categoryId, String keyWord, double lowMemberPrice,
			double highMemberPrice, double lowNormalPrice, double highNormalPrice, Date startDate,
			Date endDate, int pageNo, int pageSize);

	public Product loadById(int id);
	
	public List<Product> getLatestProducts(int count);
	
	public List<Product> getRecommendedProducts(int count);
}
