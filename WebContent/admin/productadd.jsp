<%@page import="top.sadboy.shopping.Category"%>
<%@page import="top.sadboy.shopping.ProductMrg"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="top.sadboy.shopping.Product"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* int categoryId = -1;
Category c = null;
String strCategoryId = request.getParameter("cid");
System.out.println("id "+strCategoryId);
if (strCategoryId != null && !strCategoryId.trim().equals("")) {
	System.out.println("get into");
	try {
		categoryId = Integer.parseInt(request.getParameter("cid"));
		c = Category.loadById(categoryId);
	} catch (NumberFormatException e){
		e.printStackTrace();
	}
}
	System.out.println("categoryid:"+categoryId);*/
%>


<%
request.setCharacterEncoding("utf-8");

String strCategoryId = request.getParameter("cid");
int categoryId = -1;
Category c = null;
if (strCategoryId != null && !strCategoryId.trim().equals("")) {
	try {
		categoryId = Integer.parseInt(strCategoryId);
		c = Category.loadById(categoryId);
	} catch (NumberFormatException e){
		e.printStackTrace();
	}
}

String action = request.getParameter("action");
if (action != null && action.trim().equals("add")) {
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	double normalPrice = Double.parseDouble(request.getParameter("nprice"));
	double memberPrice = Double.parseDouble(request.getParameter("mprice"));
	System.out.println("cc:"+c);
	// only leaf can be added
	if (c != null) {
		if (!c.isLeaf()) {
			out.println("Product can be added when the category is leaf!");
			return;
		}
	}
	Product p = new Product();
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setPdate(new Timestamp(System.currentTimeMillis()));
	p.setCategoryId(categoryId);
	
	ProductMrg.getInstance().addProduct(p);
	System.out.println("categoryid:"+categoryId);
	out.println("Add Product Success!");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/semantic.css">
<script src="../scripts/jquery-3.2.1.min.js"></script>
<script src="../scripts/semantic.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<div class="ui container vertical segment">
		<center><h2>Product Add</h2></center>
		<form class="ui form segment" action="productadd.jsp?cid=<%= categoryId %>" method="post">
			<input type="hidden" name="action" value="add" />
			<div class="field">
				<label>Product Name</label> <input placeholder="Product Name"
					name="name" id="" type="text" value="">
			</div>

			<div class="two fields">
				<div class="field">
					<label>Normal Price</label> <input placeholder="Normal Price"
						name="nprice" id="" type="text" value="">
				</div>

				<div class="field">
					<label>Member Price</label> <input placeholder="Member Price"
						name="mprice" id="" type="text" value="">
				</div>
			</div>
			
			<div class="field">
				<label>Category</label>
				<select name="cid">
					<option value="0" >All</option>
					<%
					List<Category> categories = Category.getCategorys();
						for (Iterator<Category> it = categories.iterator(); it.hasNext();) {
							Category c1 = it.next();
							String preStr = "";
							for (int i = 1; i < c1.getGrade(); i++) {
								preStr += "--";
							}
							if (c1.isLeaf()) {
								
					%>
					<!-- 这里是得到categories后一直循环，直到有和传过来的cid相同的时候，才会被selected -->
					<option value="<%=c1.getId()%>" <%= c1.getId() == categoryId ? "selected" : "" %>> <%=preStr + c1.getName()%> </option>
					<%
							}
						}
					%>

				</select>
			</div>
			
			<div class="field">
				<label>Product Describe</label>
				<textarea rows="8" cols="40" name="descr" id=''></textarea>
			</div>

			<button type="submit" name="button" class="ui grey button">Submit</button>
			<!-- <div class="ui primary submit button" onclick="login()">Submit</div> -->
			<!-- <div class="ui primary submit button" type="submit">Submit</div> -->
			<div class="ui reset button">Reset</div>
		</form>
	</div>

</body>
</html>