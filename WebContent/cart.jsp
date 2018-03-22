<%@page import="top.sadboy.shopping.*"%>
<%@page import="java.util.*" %>
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
Cart cart = (Cart)session.getAttribute("cart");
if (cart == null) {
	out.println("The cart is nothing!");
}
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Products In Cart Template Flat Responsive Widget Template | Home :: w3layouts</title>

    <link rel="stylesheet" href="css/bootstrap/css/bootstrap.min.css">
	<link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="js/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
	<link href="css/themecss/lib.css" rel="stylesheet">
	<link href="js/jquery-ui/jquery-ui.min.css" rel="stylesheet">

<link href="css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Flash Registration Form  Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--web-fonts-->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'></head>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700,300,200' rel='stylesheet' type='text/css'>
<script src="scripts/jquery-3.2.1.min.js"></script>
<script>$(document).ready(function(c) {
	$('.close').on('click', function(c){
		$('.product-section').fadeOut('slow', function(c){
	  		$('.product-section').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.close1').on('click', function(c){
		$('.product1').fadeOut('slow', function(c){
	  		$('.product1').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.close2').on('click', function(c){
		$('.product2').fadeOut('slow', function(c){
	  		$('.product2').remove();
		});
	});	  
});
</script>
<body>
		<!---header--->
		<div class="header">
			<h1>Products In Cart</h1>
		</div>
		<!---header--->
		<!---main--->
		<form action="cartupdate.jsp" method="post">
			<div class="main-section">
					
					<%
					List<CartItem> items = cart.getItems();
					for (int i=0; i<items.size(); i++) {
						CartItem ci = items.get(i);
						%>
						
						<div class="product-section">
						<div class="product-top">
							<div class="product-left">
								<img src="image/product/<%= ci.getProductId() %>.jpg">
							</div>
							<div class="product-right">
								<h2><%= ci.getName() %></h2>
									<h5>Count:<%= ci.getCount() %></h5>
									<ul class="size">
										<li>Price:<%= ci.getPrice() %></li>
										<li>TotalPrice:<%= ci.getTotalPrice() %></li>
									</ul>
							</div>
						</div>
						<div class="product-middle">
						<!-- 这里可以做个把count作为option的选中项 -->
						<!-- 修改想购买product的数量，用select的name传递过去 -->
							<select class="sel" name="<%= "p"+ci.getProductId() %>">
								<%
								for (int j=1; j<=10; j++) {
									%>
									<option value="<%= j %>" <%= ci.getCount() == j ? "selected" : "" %>> <%= j %> </option>
									<%
								}
								%>
<!-- 								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
								<option value="">4</option>
								<option value="">5</option> -->
							</select>
						</div>
						<div class="product-right1">
							<p>$<%= ci.getTotalPrice() %><p>
							<div class="close"> </div>
						</div>
						<div class="clear"></div>
					</div>
						
						<%
					}
					%>
					
				<div class="product-bottom">
				<!-- 四舍五入保留2位小数 -->
					<h3>summary : <span> $<%= Math.round(cart.getTotalPrice() * 100.0 / 100.0) %></h3>
					<input type="button" class="btn btn-mega" onclick="document.location.href='confirm.jsp'" value="Check Out"></input>
<!-- 					<button type="" class="btn btn-mega btn-lg" onclick="document.location.href='confirm.jsp'">Check Out</button> -->
					<div class="clear"></div>
			    </div>
			    
			    <div class="product-bottom1">
					<button type="" class="btn btn-mega btn-lg">Modify the COUNT</button>
					<div class="clear"></div>
			    </div>
			</div>	
			</form>
			<div class="footer">
			<p>&copy 2017 Products In Cart . All rights reserved </p>
		</div>

		<!---main--->
</body>
</html>