<%@page import="top.sadboy.shopping.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	User u = (User) session.getAttribute("user");
	if (u == null) {
		out.println("You have not loginn yet!Continue buy with the normal price.");
		//out.println("<a href=confirmusenormal.jsp>Continue</a><br>");
		out.println("<a href=login.jsp>Login</a><br>");
	}
%>

<%
	Cart cart = (Cart) session.getAttribute("cart");
	if (cart == null) {
		out.println("The cart is nothing!");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Flash Registration Form  Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--web-fonts-->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
</head>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700,300,200'
	rel='stylesheet' type='text/css'>
	
<script src="scripts/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Confirm Payment</title>
</head>
<body>
	<div class="header">
		<h1>Products In Cart</h1>
	</div>
	<!---header--->
	<!---main--->
	<form action="cartupdate.jsp" method="post">
		<div class="main-section">
			<%
				List<CartItem> items = cart.getItems();
				Product p = null;
				for (int i = 0; i < items.size(); i++) {
					CartItem ci = items.get(i);
					p = ProductMrg.getInstance().loadById(ci.getProductId());
			%>

			<div class="product-section">
				<div class="product-top">
					<div class="product-left">
						<img src="image/product/<%= ci.getProductId() %>.jpg">
					</div>
					<div class="product-right">
						<h2><%=ci.getName()%></h2>
						<h5>
							Count:<%=ci.getCount()%></h5>
						<ul class="size">
							<li><%=(u == null) ? "NormalPrice:" + p.getNormalPrice() : "MemberPrice:" + p.getMemberPrice()%></li>
							<% 
							/* 如果没登入我就显示normal price登录了就用member price */
							if (u != null) {
								ci.setPrice(p.getMemberPrice());
							}
							%>
							<li>TotalPrice:<%=ci.getTotalPrice()%></li>
						</ul>
					</div>
				</div>
				<div class="product-middle">
					<!-- 这里可以做个把count作为option的选中项 -->
					<!-- 修改想购买product的数量，用select的name传递过去 -->
					<select class="sel" name="<%="p" + ci.getProductId()%>">
						<option value="<%= ci.getCount() %>" selected="selected">
							<%= ci.getCount() %>
						</option>
					</select>
				</div>
				<div class="product-right1">
					<p>
						$<%=ci.getTotalPrice()%>
					<p>
					<div class="close"></div>
				</div>
				<div class="clear"></div>
			</div>

			<%
				}
			%>
			<div class="product-bottom">
				<h3>
					summary : <span> $<%=Math.round(cart.getTotalPrice() * 100.0 / 100.0)%> </span>
					<br>
<!-- 					<a href="asd.jsp">Confirm Address</a> -->
				</h3>
				<div class="clear"></div>
			</div>
		</div>
	</form>
	<div class="footer">
		<h2><p>Welcome! <%= (u != null) ? u.getUsername() : "" %> Here's your address:</p></h2>
		
		<form action="order.jsp" method="post">
			<textarea rows="8" cols="60" name="addr"><%= (u != null) ? u.getAddr() : "" %></textarea>
			<br>
			<input type="submit" value="Order" />
		</form>
	</div>
	

</body>
</html>