<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="top.sadboy.shopping.*"%>
<%@ page import="java.util.*"%>
 
<%-- <%@ include file="sessioncheck.jsp" %> --%>

<!-- 咱在这里实现分页功能，通过last page和next page作为超链接来传递页数参数pageno，
通过接受到的pageno来调用DAO中的方法 -->

<%!
private static final int PAGE_SIZE = 5;
int pageCount = 100;
%>

<%
String strPageNo = request.getParameter("pageno");
int pageNo = 1;
if (strPageNo != null) {
	try {
		pageNo = Integer.parseInt(strPageNo);
	} catch (NumberFormatException e) {
		out.println("Get out of here!");
	}
}
if (pageNo < 1) {
	pageNo = 1;
}
if (pageNo > pageCount) {
	pageNo = pageCount;
}
%>

<%
	/* List<Product> products = ProductMrg.getInstance().getProducts(); */
	/* List<Product> products = ProductMrg.getInstance().getProducts(pageNo, PAGE_SIZE); */
	List<Product> products = new ArrayList<Product>();
	pageCount = ProductMrg.getInstance().getProducts(products, pageNo, PAGE_SIZE);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet">
<title>ProductList</title>
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
							<th>Describe</th>
							<th>Normal Price</th>
							<th>Member Price</th>
							<th>Up Date</th>
							<th>Category ID</th>
							<th>Modify</th>
							<th>Delete</th>
							<th>UploadPic</th>
							<th>DownLoadPic</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Iterator<Product> it = products.iterator(); it.hasNext();) {
								Product p = it.next();
						%>
						<tr> 
							<td><%=p.getId()%></td>
							<td><%=p.getName()%></td>
							<td><%=p.getDescr()%></td>
							<td><%=p.getNormalPrice()%></td>
							<td><%=p.getMemberPrice()%></td>
							<td><%=p.getPdate()%></td>
							<td><%=p.getCategory().getName()%></td>
							
							<td><a href="productmodify.jsp?id=<%=p.getId()%>" class="btn">Modify</a></td>
							<td><a href="productdel.jsp?id=<%=p.getId()%>" class="btn">Delete</a></td>
							<td><a href="productimageup.jsp?id=<%=p.getId()%>" class="btn">Pic Upload</a></td>
							<td><a href="download.jsp?id=<%= p.getId() %>" class="btn">Pic Upload</a></td>
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
				<center>TotalPage : <%= pageCount %></center>
				
				<center>
					Current Page : <%= pageNo %>
				</center>
				
				<center>
					<%
						for (int i=1; i<=pageCount; i++) {
					%>
							<a href="productlist.jsp?pageno=<%= i %>"><%= i %></a>
					<%		
						}
					%>
				</center>
				
				<center>
					<a href="productlist.jsp?pageno=<%=pageNo - 1%>">Last Page</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="productlist.jsp?pageno=<%=pageNo + 1%>">Next Page</a>
				</center> 
		</div>
	</div>

</body>
</html>