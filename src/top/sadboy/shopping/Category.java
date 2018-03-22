package top.sadboy.shopping;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Category {
	int id;
	String name;
	String descr;
	int pid;
	boolean leaf;
	int grade;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public boolean isLeaf() {
		return leaf;
	}

	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public static void add(Category c) {
		CategoryDAO.save(c);
	}
	
	// 用咱当前结点来添加一个子结点
	public static void addChild(Category c) {
		Category.addChildCategory(c.getPid(), c.getName(), c.getDescr());
	}

	public static void addTopCategory(String name, String descr) {
/*		Category c = new Category();
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);
		c.setLeaf(true);
		c.setGrade(1);*/

		addChildCategory(0, name, descr);
	}
	
	public static void addChildCategory(int pid, String name, String descr) {
		CategoryDAO.addChildCategory(pid, name, descr);
	}

	public static List<Category> getCategorys() {
		List<Category> categories = new ArrayList<Category>();
		CategoryDAO.getCategories(categories, 0);
		return categories;
	}
	
	public static Category loadById(int id) {
		return CategoryDAO.loadById(id);
	}
	
	public static void judgeLeaf(int id, int pid) {
		CategoryDAO.judgeLeaf(id, pid);
	}
	
//	public static boolean isLeaf(int id) {
//		return false;
//	}
}
