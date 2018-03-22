<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="top.sadboy.shopping.*"%>
<%@ page import="java.util.*"%>
<%@ include file="sessioncheck.jsp" %>

<%
	List<Category> categories = Category.getCategorys();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet">
<title>UserList1</title>
</head>

<body>
	<!--body wrapper start-->

	<div class="wrapper">
		<div class="">
			<section class="panel">
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>PID</th>
							<th>Grade</th>
							<th>Add</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Iterator<Category> it = categories.iterator(); it.hasNext();) {
								Category c = (Category) it.next();
								String preStr = "";
								for (int i=1; i<c.getGrade(); i++) {
									preStr += "----";
								}
						%>
						<tr> 
							<td><%=c.getId()%></td>
							<td><%= preStr + c.getName()%></td>
							<td><%=c.getPid()%></td>
							<td><%=c.getGrade()%></td>
							<td>
								<a href="categoryadd.jsp?pid=<%=c.getId()%>" class="btn">Add Category</a>
								<!-- 只有该category是叶子节点时，才可以添加product -->
								<%
								if (c.isLeaf()) {
								%>
									<a href="productadd.jsp?cid=<%=c.getId()%>" class="btn">Add Product</a>
								<%	
								}
								%>
							</td>
							<td><a href="categorydel.jsp?id=<%= c.getId() %>&pid=<%= c.getPid() %>" class="btn">Delete</a></td>
						</tr>
						<%
							}
						%>
						<tr>

						</tr>
					</tbody>
				</table>
			</div>
			</section>
		</div>
	</div>

</body>
</html>