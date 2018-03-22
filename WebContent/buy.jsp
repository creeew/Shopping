<%@page import="top.sadboy.shopping.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 购物车功能，不必每次都new一个新的cart出来 -->
<%
Cart cart = (Cart)session.getAttribute("cart");
if (cart == null) {
	cart = new Cart();
	session.setAttribute("cart", cart);
}
%> 

<!-- 下面这个段代码跟上面全部的《%%》具有相同作用 -->
<%-- <jsp:useBean id="cart" class="top.sadboy.shopping.Cart" scope="session"></jsp:useBean>    --%>

<%
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductMrg.getInstance().loadById(id);
CartItem ci = new CartItem();

ci.setProductId(p.getId());
ci.setName(p.getName());
ci.setPrice(p.getNormalPrice());
ci.setCount(1);
cart.add(ci);

response.sendRedirect("cart.jsp");
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Products In Cart Template Flat Responsive Widget Template | Home :: w3layouts</title>
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
			<div class="main">
				<div class="main-section">
				
					<div class="product-section">
						<div class="product-top">
							<div class="product-left">
								<img src="image/p1.jpg">
							</div>
							<div class="product-right">
								<h2>Lorem ipsum dolor sit amet</h2>
									<h5>Adispree White Running Shoes</h5>
									<ul class="size">
										<li>Size 7</li>
										<li>Qty 1</li>
									</ul>
							</div>
						</div>
						<div class="product-middle">
							<select class="sel">
								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
								<option value="">4</option>
								<option value="">5</option>
							</select>
						</div>
						<div class="product-right1">
							<p>$029,10<p>
							<div class="close"> </div>
						</div>
						<div class="clear"></div>
					</div>
					
				   <div class="product1">
						<div class="product-top">
							<div class="product-left">
								<img src="image/p2.jpg">
							</div>
							<div class="product-right">
								<h2>Lorem ipsum dolor sit amet</h2>
									<h5>Adispree Color Watch</h5>
									<ul class="size">
										<li>Size 8</li>
										<li>Qty 1</li>
									</ul>
							</div>
						</div>
						<div class="product-middle">
							<select class="sel">
								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
								<option value="">4</option>
								<option value="">5</option>
							</select>
						</div>
						<div class="product-right1">
							<p>$019,10<p>
							<div class="close1"> </div>
						</div>
						<div class="clear"></div>
					</div>
					
					<div class="product2">
						<div class="product-top">
							<div class="product-left">
								<img src="image/p3.jpg">
							</div>
							<div class="product-right">
								<h2>Lorem ipsum dolor sit amet</h2>
									<h5>Adispree Hand Bag</h5>
									<ul class="size">
										<li>Size 9</li>
										<li>Qty 1</li>
									</ul>
							</div>
						</div>
						<div class="product-middle">
							<select class="sel">
								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
								<option value="">4</option>
								<option value="">5</option>
							</select>
						</div>
						<div class="product-right1">
							<p>$009,10<p>
							<div class="close2"> </div>
						</div>
						<div class="clear"></div>
					</div>
					
					<div class="product-bottom">
						<h3>summary : <span> $50,30</h3>
						<a href="#">Checkout</a>
						<div class="clear">
					</div>
				</div>
			</div>	
			<div class="footer">
			<p>&copy 2017 Products In Cart . All rights reserved </p>
		</div>

		<!---main--->
</body>
</html>