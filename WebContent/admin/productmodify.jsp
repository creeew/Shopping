<%@page import="top.sadboy.shopping.Category"%>
<%@page import="top.sadboy.shopping.ProductMrg"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="top.sadboy.shopping.Product"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
int pid;
%>

<%
request.setCharacterEncoding("utf-8");

String strPid = request.getParameter("id");
if (strPid != null && !strPid.trim().equals("")) {
	try {
		pid = Integer.parseInt(strPid);
	} catch (NumberFormatException e) {
		e.printStackTrace();
	}
}

Product lp = ProductMrg.getInstance().loadById(pid);

String action = request.getParameter("action");
if (action != null && action.trim().equals("modify")) {
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	int categoryId = Integer.parseInt(request.getParameter("cid"));
	double normalPrice = Double.parseDouble(request.getParameter("nprice"));
	double memberPrice = Double.parseDouble(request.getParameter("mprice"));
	
	Product p = new Product();
	p.setId(pid);
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setPdate(new Timestamp(System.currentTimeMillis()));
	p.setCategoryId(categoryId);
	out.println(p.getId());
	out.println(p.getDescr());
	out.println(p.getCategoryId());
	
	ProductMrg.getInstance().updateProduct(p);
	out.println("Modify Product Success!");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/semantic.css">
<script src="../scripts/jquery-3.2.1.min.js"></script>
<script src="../scripts/semantic.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Modify</title>
</head>
<body>

	<div class="ui container vertical segment">
		<center><h2>Product Modify</h2></center>
		<form class="ui form segment" action="productmodify.jsp" method="post">
			<input type="hidden" name="action" value="modify" />
			<div class="field">
				<label>Product Name</label> <input placeholder="Product Name"
					name="name" id="" type="text" value="<%= lp.getName() %>">
			</div>

			<div class="two fields">
				<div class="field">
					<label>Normal Price</label> <input placeholder="Normal Price"
						name="nprice" id="" type="text" value="<%= lp.getNormalPrice() %>">
				</div>

				<div class="field">
					<label>Member Price</label> <input placeholder="Member Price"
						name="mprice" id="" type="text" value="<%= lp.getMemberPrice() %>">
				</div>
			</div>
			
			<div class="field">
				<label>Category</label>
				<select name="cid">
					<option value="0" >All</option>
					<%
					List<Category> categories = Category.getCategorys();
						for (Iterator<Category> it = categories.iterator(); it.hasNext();) {
							Category c = it.next();
							String preStr = "";
							for (int i = 1; i < c.getGrade(); i++) {
								preStr += "--";
							}
							if (c.isLeaf()) {
								
					%>
					<!-- 只能是叶子节点的category才能出现并被选择 -->
					<option value="<%=c.getId()%>" <%= c.getId() == lp.getCategoryId() ? "selected" : "" %>> <%=preStr + c.getName()%> </option>
					<!-- 现在这里的问题是，就算是list页面里面传过来cid，但是要转成c的名字，并且还要选择从上个页面来的category -->
					<%
							}
						}
					%>

				</select>
			</div>
			
			<div class="field">
				<label>Product Describe</label>
				<textarea rows="8" cols="40" name="descr" id=''> <%= lp.getDescr() %> </textarea>
			</div>

			<button type="submit" name="button" class="ui grey button">Submit</button>
			<!-- <div class="ui primary submit button" type="submit">Submit</div> -->
			<div class="ui reset button">Reset</div>
		</form>
	</div>

</body>
</html>