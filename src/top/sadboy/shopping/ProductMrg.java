package top.sadboy.shopping;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

import top.sadboy.shopping.dao.ProductDAO;
import top.sadboy.shopping.dao.ProductMySqlDAO;

/**
 * 
 * @author OldDaddy
 * �������ˣ�����ProductDAO�ӿڣ���ֻҪ��static��ָ�����õ����������ݿ�����DAO�Ϳ����ˣ�
 * ����������ݣ���ֻ��Ҫ�޸�һ�����þͺ���
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
	
	// ���������ṩһ�����Է���pm��ĵ�������
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

	// ʵ�ַ�ҳ����
	public List<Product> getProducts(int pageNo, int pageSize) {
		return dao.getProducts(pageNo, pageSize);
	}
	
	// ���product����һ����������¼��������ҳ��
	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		return dao.getProducts(products, pageNo, pageSize);
	}

	// ���ݴ����ֶ�����ѯproduct ����Ӧ�öԴ�������Ĳ������м�⣬��ʵǰ̨ҲӦ�ü��
	public int findProducts(List<Product> list, int[] categoryId, String keyWord, double lowMemberPrice,
			double highMemberPrice, double lowNormalPrice, double highNormalPrice, Date startDate, Date endDate,
			int pageNo, int pageSize) {
		return dao.findProducts(list, categoryId, keyWord, lowMemberPrice, highMemberPrice, lowNormalPrice, highNormalPrice, startDate, endDate, pageNo, pageSize);
	}

	public boolean updateProduct(Product p) {
		return dao.updateProduct(p);
	}

	// һ��ɾ�����product����һ��
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
