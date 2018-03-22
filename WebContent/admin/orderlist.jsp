<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="top.sadboy.shopping.*"%>
<%@ page import="java.util.*"%>
 
<%-- <%@ include file="sessioncheck.jsp" %> --%>

<!-- 咱在这里实现分页功能，通过last page和next page作为超链接来传递页数参数pageno，
通过接受到的pageno来调用DAO中的方法 -->

<%!
private static final int PAGE_SIZE = 15;
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
	List<SalesOrder> orders = new ArrayList<SalesOrder>();
	pageCount = OrderMrg.getInstance().getOrders(orders, pageNo, PAGE_SIZE);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet">
<title>OrderList</title>
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
							<th>User Info</th>
							<th>Addr</th>
							<th>Order Date</th>
							<th>Status</th>
							<th>Modify</th>
							<th>Detail</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Iterator<SalesOrder> it = orders.iterator(); it.hasNext();) {
								SalesOrder so = it.next();
						%>
						<tr> 
							<td><%=so.getId()%></td>
							<td><%=so.getUser().getUsername()%></td>
							<td><%=so.getAddr()%></td>
							<td><%=so.getoDate()%></td>
							<%-- <td><%=so.getStatus()%></td> --%>
							<td>
							<form action="ordermodify.jsp" method="post">
							<select name="status">
								<% for (int i=0; i<=2; i++) {
									String stat = "";
									if (i == 0) {
										stat = "Unfinish";
									} else if (i == 1) {
										stat = "Finished";
									} else {
										stat = "Discard";
									}
									%>
									<option <%= (i==so.getStatus()) ? "selected" : "" %> value="<%= i %>"><%= stat %></option>
									<%	
								 }
								%>
							</select>
							
							</td>
							<%-- <td><a href="ordermodify.jsp?id=<%=so.getId()%>" class="btn">StatusModify</a></td> --%>
							<input type="hidden" name="id" value="<%= so.getId() %>" />
							<td><button type="submit" name="button" class="ui grey button">StatusModify</button></td>
							</form>
							<td><a href="orderdetailshow.jsp?id=<%=so.getId()%>" class="btn">Detail</a></td>
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