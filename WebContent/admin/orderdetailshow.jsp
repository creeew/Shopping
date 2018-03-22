<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="top.sadboy.shopping.*"%>
<%@ page import="java.util.*"%>
 
<%-- <%@ include file="sessioncheck.jsp" %> --%>

<!-- 得到一个salesorder，通过这个对象来得到salesitem，从而得到该订单的详细信息
 -->
<%
request.setCharacterEncoding("utf-8");
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMrg.getInstance().loadById(id);
List<SalesItem> items = OrderMrg.getInstance().getSalesItems(so);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet">
<title>OrderDetail</title>
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
							<center><h2>Order by : <%= (so.getUser() == null) ? "Anonymous" : so.getUser().getUsername() %></h2></center>
						</tr>
						<tr>
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Product Price</th>
							<th>Product Quantity</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Iterator<SalesItem> it = items.iterator(); it.hasNext();) {
								SalesItem si = it.next();
						%>
						<tr> 
							<td><%=si.getProduct().getId()%></td>
							<td><%=si.getProduct().getName()%></td>
							<td><%=si.getUnitprice()%></td>
							<td><%=si.getCount()%></td>
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