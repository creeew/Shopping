package top.sadboy.shopping;

import java.util.List;

import top.sadboy.shopping.dao.OrderMysqlDAO;

public class OrderMrg {
	public static OrderMrg getInstance() {
		return om;
	}
	
	private static OrderMrg om = null;
	
	static {
		if (om == null) {
			om = new OrderMrg();
			om.setDao(new OrderMysqlDAO());
		}
	}
	
	OrderMysqlDAO dao;

	public OrderMysqlDAO getDao() {
		return dao;
	}

	public void setDao(OrderMysqlDAO dao) {
		this.dao = dao;
	}
	
	public void saveOrder(SalesOrder so) {
		dao.saveOrder(so);
	}
	
	public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize) {
		return dao.getOrders(orders, pageNo, pageSize);
	}
	
	public SalesOrder loadById(int id) {
		return dao.loadById(id);
	}

	public List<SalesItem> getSalesItems(SalesOrder salesOrder) {
		return dao.getSalesItems(salesOrder);
	}
	
	public void updateStatus(SalesOrder so) {
		dao.updateStatus(so);
	}
}
