<%@page import="top.sadboy.shopping.Category"%>
<%@page import="top.sadboy.shopping.ProductMrg"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="top.sadboy.shopping.Product"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String strId = request.getParameter("id");
int id = -1;
if (strId != null && !strId.trim().equals("")) {
	id = Integer.parseInt(strId);
}
Product p = ProductMrg.getInstance().loadById(id);
%>	
	
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic page needs
	============================================ -->
	<title></title>
	<meta charset="utf-8">
    <meta name="keywords" content="" />
    <meta name="author" content="Magentech">
    <meta name="robots" content="index, follow" />

	<!-- Mobile specific metas
	============================================ -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<!-- Favicon
	============================================ -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="ico/favicon.png">

<!-- 	<!-- Google web fonts
	============================================ -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'> -->

    <!-- Libs CSS
	============================================ -->
    <link rel="stylesheet" href="css/bootstrap/css/bootstrap.min.css">
	<link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="js/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
	<link href="css/themecss/lib.css" rel="stylesheet">
	<link href="js/jquery-ui/jquery-ui.min.css" rel="stylesheet">

	<!-- Theme CSS
	============================================ -->
   	<link href="css/themecss/so_megamenu.css" rel="stylesheet">
    <link href="css/themecss/so-categories.css" rel="stylesheet">
	<link href="css/themecss/so-listing-tabs.css" rel="stylesheet">

		<link id="color_scheme" href="css/theme.css" rel="stylesheet">

	<link href="css/responsive.css" rel="stylesheet">



</head>

<body class="res layout-subpage">



    <div id="wrapper" class="wrapper-full ">
	<!-- Header Container  -->
	<header id="header" class=" variantleft type_1">
<!-- Header Top -->
<div class="header-top">
	<div class="container">
		<div class="row">
			<div class="header-top-left form-inline col-sm-6 col-xs-12 compact-hidden">
				<div class="form-group languages-block ">
					<form action="index.html" method="post" enctype="multipart/form-data" id="bt-language">
						<a class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
							<img src="image/demo/flags/gb.png" alt="English" title="English">
							<span class="">English</span>
							<span class="fa fa-angle-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="index.html"><img class="image_flag" src="image/demo/flags/gb.png" alt="English" title="English" /> English </a></li>
							<li> <a href="index.html"> <img class="image_flag" src="image/demo/flags/lb.png" alt="Arabic" title="Arabic" /> Arabic </a> </li>
						</ul>
					</form>
				</div>

				<div class="form-group currencies-block">
					<form action="index.html" method="post" enctype="multipart/form-data" id="currency">
						<a class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
							<span class="icon icon-credit "></span> US Dollar <span class="fa fa-angle-down"></span>
						</a>
						<ul class="dropdown-menu btn-xs">
							<li> <a href="#">(€)&nbsp;Euro</a></li>
							<li> <a href="#">(£)&nbsp;Pounds	</a></li>
							<li> <a href="#">($)&nbsp;US Dollar	</a></li>
						</ul>
					</form>
				</div>
			</div>
			<div class="header-top-right collapsed-block text-right  col-sm-6 col-xs-12 compact-hidden">
				<h5 class="tabBlockTitle visible-xs">More<a class="expander " href="#TabBlock-1"><i class="fa fa-angle-down"></i></a></h5>
				<div class="tabBlock" id="TabBlock-1">
					<ul class="top-link list-inline">
						<li class="account" id="my_account">
							<a href="#" title="My Account" class="btn btn-xs dropdown-toggle" data-toggle="dropdown"> <span >My Account</span> <span class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu ">
								<li><a href="register.html"><i class="fa fa-user"></i> Register</a></li>
								<li><a href="login.html"><i class="fa fa-pencil-square-o"></i> Login</a></li>
							</ul>
						</li>
						<li class="wishlist"><a href="#" id="wishlist-total" class="top-link-wishlist" title="Wish List (2)"><span>Wish List (2)</span></a></li>
						<li class="checkout"><a href="#" class="top-link-checkout" title="Checkout"><span >Checkout</span></a></li>
						<li class="login"><a href="#" title="Shopping Cart"><span >Shopping Cart</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //Header Top -->

<!-- Header center -->
<div class="header-center left">
	<div class="container">
		<div class="row">
			<!-- Logo -->
			<div class="navbar-logo col-md-3 col-sm-12 col-xs-12">
				<a href="index.html"><img src="image/demo/logos/theme_logo.png" title="Your Store" alt="Your Store" /></a>
			</div>
			<!-- //end Logo -->

			<!-- Search -->
			<div id="sosearchpro" class="col-sm-7 search-pro">
				<form method="GET" action="index.html">
					<div id="search0" class="search input-group">
						<div class="select_category filter_type icon-select">
							<select class="no-border" name="category_id">
								<option value="0">All Categories</option>
								<option value="78">Apparel</option>
								<option value="77">Cables &amp; Connectors</option>
								<option value="82">Cameras &amp; Photo</option>
								<option value="80">Flashlights &amp; Lamps</option>
								<option value="81">Mobile Accessories</option>
								<option value="79">Video Games</option>
								<option value="20">Jewelry &amp; Watches</option>
								<option value="76">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Earings</option>
								<option value="26">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wedding Rings</option>
								<option value="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Men Watches</option>
							</select>
						</div>

						<input class="autosearch-input form-control" type="text" value="" size="50" autocomplete="off" placeholder="Search" name="search">
						<span class="input-group-btn">
						<button type="submit" class="button-search btn btn-primary" name="submit_search"><i class="fa fa-search"></i></button>
						</span>
					</div>
					<input type="hidden" name="route" value="product/search" />
				</form>
			</div>
			<!-- //end Search -->

			<!-- Secondary menu -->
			<div class="col-md-2 col-sm-5 col-xs-12 shopping_cart pull-right">
				<!--cart-->
				<div id="cart" class=" btn-group btn-shopping-cart">
					<a data-loading-text="Loading..." class="top_cart dropdown-toggle" data-toggle="dropdown">
						<div class="shopcart">
							<span class="handle pull-left"></span>
							<span class="title">My cart</span>
							<p class="text-shopping-cart cart-total-full">2 item(s) - $1,262.00 </p>
						</div>
					</a>

					<ul class="tab-content content dropdown-menu pull-right shoppingcart-box" role="menu">

						<li>
							<table class="table table-striped">
								<tbody>
									<tr>
										<td class="text-center" style="width:70px">
											<a href="product.html"> <img src="image/demo/shop/product/35.jpg" style="width:70px" alt="Filet Mign" title="Filet Mign" class="preview"> </a>
										</td>
										<td class="text-left"> <a class="cart_product_name" href="product.html">Filet Mign</a> </td>
										<td class="text-center"> x1 </td>
										<td class="text-center"> $1,202.00 </td>
										<td class="text-right">
											<a href="product.html" class="fa fa-edit"></a>
										</td>
										<td class="text-right">
											<a onclick="cart.remove('2');" class="fa fa-times fa-delete"></a>
										</td>
									</tr>
									<tr>
										<td class="text-center" style="width:70px">
											<a href="product.html"> <img src="image/demo/shop/product/141.jpg" style="width:70px" alt="Canon EOS 5D" title="Canon EOS 5D" class="preview"> </a>
										</td>
										<td class="text-left"> <a class="cart_product_name" href="product.html">Canon EOS 5D</a> </td>
										<td class="text-center"> x1 </td>
										<td class="text-center"> $60.00 </td>
										<td class="text-right">
											<a href="product.html" class="fa fa-edit"></a>
										</td>
										<td class="text-right">
											<a onclick="cart.remove('1');" class="fa fa-times fa-delete"></a>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
						<li>
							<div>
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td class="text-left"><strong>Sub-Total</strong>
											</td>
											<td class="text-right">$1,060.00</td>
										</tr>
										<tr>
											<td class="text-left"><strong>Eco Tax (-2.00)</strong>
											</td>
											<td class="text-right">$2.00</td>
										</tr>
										<tr>
											<td class="text-left"><strong>VAT (20%)</strong>
											</td>
											<td class="text-right">$200.00</td>
										</tr>
										<tr>
											<td class="text-left"><strong>Total</strong>
											</td>
											<td class="text-right">$1,262.00</td>
										</tr>
									</tbody>
								</table>
								<p class="text-right"> <a class="btn view-cart" href="#"><i class="fa fa-shopping-cart"></i>View Cart</a>&nbsp;&nbsp;&nbsp; <a class="btn btn-mega checkout-cart" href="#"><i class="fa fa-share"></i>Checkout</a> </p>
							</div>
						</li>
					</ul>
				</div>
				<!--//cart-->
			</div>
		</div>

	</div>
</div>
<!-- //Header center -->

<!-- Header Bottom -->
<div class="header-bottom">
	<div class="container">
		<div class="row">

			<div class="sidebar-menu col-md-3 col-sm-6 col-xs-12 ">
				<div class="responsive so-megamenu ">
					<div class="so-vertical-menu no-gutter compact-hidden">
						<nav class="navbar-default">

							<div class="container-megamenu vertical  ">

								<div id="menuHeading">
									<div class="megamenuToogle-wrapper">
										<div class="megamenuToogle-pattern">
											<div class="container">
												<div>
													<span></span>
													<span></span>
													<span></span>
												</div>
												All Categories
												<i class="fa pull-right arrow-circle fa-chevron-circle-up"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="navbar-header">
									<button type="button" id="show-verticalmenu" data-toggle="collapse" class="navbar-toggle fa fa-list-alt">

									</button>
									All Categories
								</div>
								<div class="vertical-wrapper" >
									<span id="remove-verticalmenu" class="fa fa-times"></span>
									<div class="megamenu-pattern">
										<div class="container">
											<ul class="megamenu">
												<li class="item-vertical style1 with-sub-menu hover">
													<p class="close-menu"></p>
													<a href="#" class="clearfix">
														<img src="image/theme/icons/9.png" alt="icon">
														<span>Automotive &amp; Motocrycle</span>
														<b class="caret"></b>
													</a>
													<div class="sub-menu" data-subwidth="100" >
														<div class="content" >
															<div class="row">
																<div class="col-sm-12">
																	<div class="row">
																		<div class="col-md-4 static-menu">
																			<div class="menu">
																				<ul>
																					<li>
																						<a href="#"  class="main-menu">Apparel</a>
																						<ul>
																							<li><a href="#" >Accessories for Tablet PC</a></li>
																							<li><a href="#" >Accessories for i Pad</a></li>
																							<li><a  href="#" >Accessories for iPhone</a></li>
																							<li><a href="#" >Bags, Holiday Supplies</a></li>
																							<li><a href="#" >Car Alarms and Security</a></li>
																							<li><a href="#" >Car Audio &amp; Speakers</a></li>
																						</ul>
																					</li>
																					<li>
																						<a href="#"  class="main-menu">Cables &amp; Connectors</a>
																						<ul>
																							<li><a href="#" >Cameras &amp; Photo</a></li>
																							<li><a href="#" >Electronics</a></li>
																							<li><a href="#" >Outdoor &amp; Traveling</a></li>
																						</ul>
																					</li>
																				</ul>
																			</div>
																		</div>
																		<div class="col-md-4 static-menu">
																			<div class="menu">
																				<ul>
																					<li>
																						<a href="#"  class="main-menu">Camping &amp; Hiking</a>
																						<ul>
																							<li><a href="#" >Earings</a></li>
																							<li><a href="#" >Shaving &amp; Hair Removal</a></li>
																							<li><a href="#" >Salon &amp; Spa Equipment</a></li>
																						</ul>
																					</li>
																					<li>
																						<a href="#" class="main-menu">Smartphone &amp; Tablets</a>
																						<ul>
																							<li><a href="#" >Sports &amp; Outdoors</a></li>
																							<li><a href="#" >Bath &amp; Body</a></li>
																							<li><a href="#" >Gadgets &amp; Auto Parts</a></li>
																						</ul>
																					</li>
																				</ul>
																			</div>
																		</div>
																		<div class="col-md-4 static-menu">
																			<div class="menu">
																				<ul>
																					<li>
																						<a href="#"  class="main-menu">Bags, Holiday Supplies</a>
																						<ul>
																							<li><a href="#" onclick="window.location = '18_46';">Battereries &amp; Chargers</a></li>
																							<li><a href="#" onclick="window.location = '24_64';">Bath &amp; Body</a></li>
																							<li><a href="#" onclick="window.location = '18_45';">Headphones, Headsets</a></li>
																							<li><a href="#" onclick="window.location = '18_30';">Home Audio</a></li>
																						</ul>
																					</li>
																				</ul>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</li>
												<li class="item-vertical">
													<p class="close-menu"></p>
													<a href="#" class="clearfix">
														<img src="image/theme/icons/10.png" alt="icon">
														<span>Electronic</span>

													</a>
												</li>
												<li class="item-vertical with-sub-menu hover">
													<p class="close-menu"></p>
													<a href="#" class="clearfix">
														<span class="label"></span>
														<img src="image/theme/icons/3.png" alt="icon">
														<span>Sports &amp; Outdoors</span>
														<b class="caret"></b>
													</a>
													<div class="sub-menu" data-subwidth="60" >
														<div class="content">
															<div class="row">
																<div class="col-md-6">
																	<div class="row">
																		<div class="col-md-12 static-menu">
																			<div class="menu">
																				<ul>
																					<li>
																						<a href="#" onclick="window.location = '81';" class="main-menu">Mobile Accessories</a>
																						<ul>
																							<li><a href="#" onclick="window.location = '33_63';">Gadgets &amp; Auto Parts</a></li>
																							<li><a href="#" onclick="window.location = '24_64';">Bath &amp; Body</a></li>
																							<li><a href="#" onclick="window.location = '17';">Bags, Holiday Supplies</a></li>
																						</ul>
																					</li>
																					<li>
																						<a href="#" onclick="window.location = '18_46';" class="main-menu">Battereries &amp; Chargers</a>
																						<ul>
																							<li><a href="#" onclick="window.location = '25_28';">Outdoor &amp; Traveling</a></li>
																							<li><a href="#" onclick="window.location = '80';">Flashlights &amp; Lamps</a></li>
																							<li><a href="#" onclick="window.location = '24_66';">Fragrances</a></li>
																						</ul>
																					</li>
																					<li>
																						<a href="#" onclick="window.location = '25_31';" class="main-menu">Fishing</a>
																						<ul>
																							<li><a href="#" onclick="window.location = '57_73';">FPV System &amp; Parts</a></li>
																							<li><a href="#" onclick="window.location = '18';">Electronics</a></li>
																							<li><a href="#" onclick="window.location = '20_76';">Earings</a></li>
																							<li><a href="#" onclick="window.location = '33_60';">More Car Accessories</a></li>
																						</ul>
																					</li>
																				</ul>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="row banner">
																		<a href="#">
																			<img src="image/demo/cms/menu_bg2.jpg" alt="banner1">
																			</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</li>
													<li class="item-vertical with-sub-menu hover">
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/2.png" alt="icon">
															<span>Health &amp; Beauty</span>
															<b class="caret"></b>
														</a>
														<div class="sub-menu" data-subwidth="100" >
															<div class="content" >
																<div class="row">
																	<div class="col-md-12">
																		<div class="row">
																			<div class="col-md-4 static-menu">
																				<div class="menu">
																					<ul>
																						<li>
																							<a href="#" class="main-menu">Car Alarms and Security</a>
																							<ul>
																								<li><a href="#" >Car Audio &amp; Speakers</a></li>
																								<li><a href="#" >Gadgets &amp; Auto Parts</a></li>
																								<li><a href="#" >Gadgets &amp; Auto Parts</a></li>
																								<li><a href="#" >Headphones, Headsets</a></li>
																							</ul>
																						</li>
																						<li>
																							<a href="" onclick="window.location = '24';" class="main-menu">Health &amp; Beauty</a>
																							<ul>
																								<li>
																									<a href="#" >Home Audio</a>
																								</li>
																								<li>
																									<a href="#" >Helicopters &amp; Parts</a>
																								</li>
																								<li>
																									<a href="#" >Outdoor &amp; Traveling</a>
																								</li>
																								<li>
																									<a href="#">Toys &amp; Hobbies</a>
																								</li>
																							</ul>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<div class="col-md-4 static-menu">
																				<div class="menu">
																					<ul>
																						<li>
																							<a href="#"  class="main-menu">Electronics</a>
																							<ul>
																								<li>
																									<a href="#">Earings</a>
																								</li>
																								<li>
																									<a href="#" >Salon &amp; Spa Equipment</a>
																								</li>
																								<li>
																									<a href="#" >Shaving &amp; Hair Removal</a>
																								</li>
																								<li>
																									<a href="#">Smartphone &amp; Tablets</a>
																								</li>
																							</ul>
																						</li>
																						<li>
																							<a href="#"  class="main-menu">Sports &amp; Outdoors</a>
																							<ul>
																								<li>
																									<a href="#" >Flashlights &amp; Lamps</a>
																								</li>
																								<li>
																									<a href="#" >Fragrances</a>
																								</li>
																								<li>
																									<a href="#" >Fishing</a>
																								</li>
																								<li>
																									<a href="#" >FPV System &amp; Parts</a>
																								</li>
																							</ul>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<div class="col-md-4 static-menu">
																				<div class="menu">
																					<ul>
																						<li>
																							<a href="#" class="main-menu">More Car Accessories</a>
																							<ul>
																								<li>
																									<a href="#" >Lighter &amp; Cigar Supplies</a>
																								</li>
																								<li>
																									<a href="#" >Mp3 Players &amp; Accessories</a>
																								</li>
																								<li>
																									<a href="#" >Men Watches</a>
																								</li>
																								<li>
																									<a href="#" >Mobile Accessories</a>
																								</li>
																							</ul>
																						</li>
																						<li>
																							<a href="#" class="main-menu">Gadgets &amp; Auto Parts</a>
																							<ul>
																								<li>
																									<a href="#" >Gift &amp; Lifestyle Gadgets</a>
																								</li>
																								<li>
																									<a href="#" >Gift for Man</a>
																								</li>
																								<li>
																									<a href="#" >Gift for Woman</a>
																								</li>
																								<li>
																									<a href="#" >Gift for Woman</a>
																								</li>
																							</ul>
																						</li>
																					</ul>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</li>
													<li class="item-vertical css-menu with-sub-menu hover">
														<p class="close-menu"></p>
														<a href="#" class="clearfix">

															<img src="image/theme/icons/2.png" alt="icon">
															<span>Smartphone &amp; Tablets</span>
															<b class="caret"></b>
														</a>
														<div class="sub-menu" data-subwidth="30" style="width: 270px; display: none; right: 0px;">
															<div class="content" style="display: none;">
																<div class="row">
																	<div class="col-sm-12">
																		<div class="row">
																			<div class="col-sm-12 hover-menu">
																				<div class="menu">
																					<ul>
																						<li>
																							<a href="#" class="main-menu">Headphones, Headsets</a>
																						</li>
																						<li>
																							<a href="#" class="main-menu">Home Audio</a>
																						</li>
																						<li>
																							<a href="#" class="main-menu">Health &amp; Beauty</a>
																						</li>
																						<li>
																							<a href="#" class="main-menu">Helicopters &amp; Parts</a>
																						</li>
																						<li>
																							<a href="#" class="main-menu">Helicopters &amp; Parts</a>
																						</li>
																					</ul>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</li>
													<li class="item-vertical">
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/11.png" alt="icon">
															<span>Flashlights &amp; Lamps</span>

														</a>
													</li>
													<li class="item-vertical">
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/4.png" alt="icon">
															<span>Camera &amp; Photo</span>
														</a>
													</li>
													<li class="item-vertical">
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/5.png" alt="icon">
															<span>Smartphone &amp; Tablets</span>
														</a>
													</li>
													<li class="item-vertical" >
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/7.png" alt="icon">
															<span>Outdoor &amp; Traveling Supplies</span>
														</a>
													</li>
													<li class="item-vertical" style="display: none;">
														<p class="close-menu"></p>

														<a href="#" class="clearfix">
															<img src="image/theme/icons/6.png" alt="icon">
															<span>Health &amp; Beauty</span>
														</a>
													</li>
													<li class="item-vertical" >
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/8.png" alt="icon">
															<span>Toys &amp; Hobbies </span>
														</a>
													</li>
													<li class="item-vertical" >
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/12.png" alt="icon">
															<span>Jewelry &amp; Watches</span>
														</a>
													</li>
													<li class="item-vertical" >
														<p class="close-menu"></p>
														<a href="#" class="clearfix">
															<img src="image/theme/icons/13.png" alt="icon">
															<span>Bags, Holiday Supplies</span>
														</a>
													</li>
													<li class="item-vertical" >
														<p class="close-menu"></p>

														<a href="#" class="clearfix">
															<img src="image/theme/icons/13.png" alt="icon">
															<span>More Car Accessories</span>
														</a>
													</li>
													<li class="loadmore">
														<i class="fa fa-plus-square-o"></i>
														<span class="more-view">More Categories</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</nav>
					</div>
				</div>

			</div>

			<!-- Main menu -->
			<div class="megamenu-hori header-bottom-right  col-md-9 col-sm-6 col-xs-12 ">
				<div class="responsive so-megamenu ">
	<nav class="navbar-default">
		<div class=" container-megamenu  horizontal">

			<div class="navbar-header">
				<button type="button" id="show-megamenu" data-toggle="collapse" class="navbar-toggle">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				Navigation
			</div>

			<div class="megamenu-wrapper">
				<span id="remove-megamenu" class="fa fa-times"></span>
				<div class="megamenu-pattern">
					<div class="container">
						<ul class="megamenu " data-transition="slide" data-animationtime="250">
							<li class="home hover">

								<a href="index.html">Home <b class="caret"></b></a>
								<div class="sub-menu" style="width:100%;" >
									<div class="content" >
										<div class="row">
											<div class="col-md-3">
												<a href="index.html" class="image-link">
													<span class="thumbnail">
														<img class="img-responsive img-border" src="image/demo/feature/home-1.jpg" alt="">
														<span class="btn btn-default">Read More</span>
													</span>
													<h3 class="figcaption">Home page - (Default)</h3>
												</a>

											</div>
											<div class="col-md-3">
												<a href="#" class="image-link">
													<span class="thumbnail">
														<img class="img-responsive img-border" src="image/demo/feature/home-2.jpg" alt="">
														<span class="btn btn-default">Read More</span>
													</span>
													<h3 class="figcaption">Home page - Layout 2</h3>
												</a>

											</div>
											<div class="col-md-3">
												<a href="#" class="image-link">
													<span class="thumbnail">
														<img class="img-responsive img-border" src="image/demo/feature/home-3.jpg" alt="">
														<span class="btn btn-default">Read More</span>
													</span>
													<h3 class="figcaption">Home page - Layout 3</h3>
												</a>

											</div>
											<div class="col-md-3">
												<a href="#" class="image-link">
													<span class="thumbnail">
														<img class="img-responsive img-border" src="image/demo/feature/home-4.jpg" alt="">
														<span class="btn btn-default">Read More</span>
													</span>
													<h3 class="figcaption">Home page - Layout 4</h3>
												</a>

											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Features</strong>
									<span class="label"> Hot</span>
									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 100%; right: auto;">
									<div class="content" >
										<div class="row">
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">Listing pages</a>
													<div>
														<ul class="row-list">
															<li><a href="category.html">Category Page 1 </a></li>
															<li><a href="#">Category Page 2</a></li>
															<li><a href="#">Category Page 3</a></li>
														</ul>

													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">Product pages</a>
													<div>
														<ul class="row-list">
															<li><a href="product.html">Image size - big</a></li>
															<li><a href="#">Image size - medium</a></li>
															<li><a href="#">Image size - small</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">Shopping pages</a>
													<div>
														<ul class="row-list">
															<li><a href="#">Shopping Cart Page</a></li>
															<li><a href="#">Checkout Page</a></li>
															<li><a href="#">Compare Page</a></li>
															<li><a href="#">Wishlist Page</a></li>

														</ul>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">My Account pages</a>
													<div>
														<ul class="row-list">
															<li><a href="login.html">Login Page</a></li>
															<li><a href="register.html">Register Page</a></li>
															<li><a href="#">My Account</a></li>
															<li><a href="#">Order History</a></li>
															<li><a href="#">Order Information</a></li>
															<li><a href="#">Product Returns</a></li>
															<li><a href="#">Gift Voucher</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Pages</strong>
									<span class="label"> Hot</span>
									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 40%; ">
									<div class="content" >
										<div class="row">
											<div class="col-md-6">
												<ul class="row-list">
													<li><a class="subcategory_item" href="#">FAQ</a></li>
													<li><a class="subcategory_item" href="#">Typography</a></li>
													<li><a class="subcategory_item" href="#">Site Map</a></li>
													<li><a class="subcategory_item" href="#">Contact us</a></li>
													<li><a class="subcategory_item" href="#">Banner Effect</a></li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="row-list">
													<li><a class="subcategory_item" href="#">About Us 1</a></li>
													<li><a class="subcategory_item" href="#">About Us 2</a></li>
													<li><a class="subcategory_item" href="#">About Us 3</a></li>
													<li><a class="subcategory_item" href="#">About Us 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Categories</strong>
									<span class="label"></span>
									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 100%; display: none;">
									<div class="content">
										<div class="row">
											<div class="col-sm-12">
												<div class="row">
													<div class="col-md-3 img img1">
														<a href="#"><img src="image/demo/cms/img1.jpg" alt="banner1"></a>
													</div>
													<div class="col-md-3 img img2">
														<a href="#"><img src="image/demo/cms/img2.jpg" alt="banner2"></a>
													</div>
													<div class="col-md-3 img img3">
														<a href="#"><img src="image/demo/cms/img3.jpg" alt="banner3"></a>
													</div>
													<div class="col-md-3 img img4">
														<a href="#"><img src="image/demo/cms/img4.jpg" alt="banner4"></a>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<a href="#" class="title-submenu">Automotive</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Car Alarms and Security</a></li>
																<li><a href="#"  class="main-menu">Car Audio &amp; Speakers</a></li>
																<li><a href="#"  class="main-menu">Gadgets &amp; Auto Parts</a></li>
																<li><a href="#"  class="main-menu">More Car Accessories</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<a href="#" class="title-submenu">Electronics</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Battereries &amp; Chargers</a></li>
																<li><a href="#"  class="main-menu">Headphones, Headsets</a></li>
																<li><a href="#"  class="main-menu">Home Audio</a></li>
																<li><a href="#"  class="main-menu">Mp3 Players &amp; Accessories</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<a href="#" class="title-submenu">Jewelry &amp; Watches</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Earings</a></li>
																<li><a href="#"  class="main-menu">Wedding Rings</a></li>
																<li><a href="#"  class="main-menu">Men Watches</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<a href="#" class="title-submenu">Bags, Holiday Supplies</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Gift &amp; Lifestyle Gadgets</a></li>
																<li><a href="#"  class="main-menu">Gift for Man</a></li>
																<li><a href="#"  class="main-menu">Gift for Woman</a></li>
																<li><a href="#"  class="main-menu">Lighter &amp; Cigar Supplies</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>

							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Accessories</strong>

									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 100%; display: none;">
									<div class="content" style="display: none;">
										<div class="row">
											<div class="col-md-8">
												<div class="row">
													<div class="col-md-6 static-menu">
														<div class="menu">
															<ul>
																<li>
																	<a href="#"  class="main-menu">Automotive</a>
																	<ul>
																		<li><a href="#">Car Alarms and Security</a></li>
																		<li><a href="#" >Car Audio &amp; Speakers</a></li>
																		<li><a href="#" >Gadgets &amp; Auto Parts</a></li>
																	</ul>
																</li>
																<li>
																	<a href="#"  class="main-menu">Smartphone &amp; Tablets</a>
																	<ul>
																		<li><a href="#" >Accessories for i Pad</a></li>
																		<li><a href="#" >Apparel</a></li>
																		<li><a href="#" >Accessories for iPhone</a></li>
																	</ul>
																</li>
															</ul>
														</div>
													</div>
													<div class="col-md-6 static-menu">
														<div class="menu">
															<ul>
																<li>
																	<a href="#" class="main-menu">Sports &amp; Outdoors</a>
																	<ul>
																		<li><a href="#" >Camping &amp; Hiking</a></li>
																		<li><a href="#" >Cameras &amp; Photo</a></li>
																		<li><a href="#" >Cables &amp; Connectors</a></li>
																	</ul>
																</li>
																<li>
																	<a href="#"  class="main-menu">Electronics</a>
																	<ul>
																		<li><a href="#" >Battereries &amp; Chargers</a></li>
																		<li><a href="#" >Bath &amp; Body</a></li>
																		<li><a href="#" >Outdoor &amp; Traveling</a></li>
																	</ul>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<span class="title-submenu">Bestseller</span>
												<div class="col-sm-12 list-product">
													<div class="product-thumb">
														<div class="image pull-left">
															<a href="#"><img src="image/demo/shop/product/35.jpg" width="80" alt="Filet Mign" title="Filet Mign" class="img-responsive"></a>
														</div>
														<div class="caption">
															<h4><a href="#">Filet Mign</a></h4>
															<div class="rating-box">
																<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
															<p class="price">$1,202.00</p>
														</div>
													</div>
												</div>
												<div class="col-sm-12 list-product">
													<div class="product-thumb">
														<div class="image pull-left">
															<a href="#"><img src="image/demo/shop/product/W1.jpg" width="80" alt="Dail Lulpa" title="Dail Lulpa" class="img-responsive"></a>
														</div>
														<div class="caption">
															<h4><a href="#">Dail Lulpa</a></h4>
															<div class="rating-box">
																<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
															<p class="price">$78.00</p>
														</div>
													</div>
												</div>
												<div class="col-sm-12 list-product">
													<div class="product-thumb">
														<div class="image pull-left">
															<a href="#"><img src="image/demo/shop/product/141.jpg" width="80" alt="Canon EOS 5D" title="Canon EOS 5D" class="img-responsive"></a>
														</div>
														<div class="caption">
															<h4><a href="#">Canon EOS 5D</a></h4>

															<div class="rating-box">
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
															<p class="price">
																<span class="price-new">$60.00</span>
																<span class="price-old">$145.00</span>

															</p>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Blog</strong>
									<span class="label"></span>
								</a>
							</li>

							<li class="hidden-md">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Buy Theme!</strong>

								</a>
							</li>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</nav>
</div>
									</div>
			<!-- //end Main menu -->

		</div>
	</div>

</div>

<!-- Navbar switcher -->
<!-- //end Navbar switcher -->
	</header>
	<!-- //Header Container  -->
	<!-- Main Container  -->
	<div class="main-container container">
		<ul class="breadcrumb">
			<li><a href="#"><i class="fa fa-home"></i></a></li>
			<li><a href="#">Smartphone & Tablets</a></li>
			<li><a href="#">Bint Beef</a></li>

		</ul>

		<div class="row">
			<!--Middle Part Start-->
			<div id="content" class="col-md-12 col-sm-12">

				<div class="product-view row">
					<div class="left-content-product col-lg-10 col-xs-12">
						<div class="row">
							<div class="content-product-left class-honizol col-sm-6 col-xs-12 ">
								<div class="large-image  ">
									<img itemprop="image" class="product-image-zoom" src="image/product/<%= id %>.jpg" data-zoom-image="image/demo/shop/product/J9.jpg" title="Bint Beef" alt="Bint Beef">
								</div>
								<a class="thumb-video pull-left" href="https://www.youtube.com/watch?v=HhabgvIIXik"><i class="fa fa-youtube-play"></i></a>
								<div id="thumb-slider" class="owl-theme owl-loaded owl-drag full_slider">
									<a data-index="0" class="img thumbnail " data-image="image/demo/shop/product/J9.jpg" title="Bint Beef">
										<img src="image/product/<%= id %>.jpg" title="Bint Beef" alt="Bint Beef">
									</a>
									<a data-index="1" class="img thumbnail " data-image="image/demo/shop/product/J6.jpg" title="Bint Beef">
										<img src="image/demo/shop/product/J6.jpg" title="Bint Beef" alt="Bint Beef">
									</a>
									<a data-index="2" class="img thumbnail " data-image="image/demo/shop/product/J5.jpg" title="Bint Beef">
										<img src="image/demo/shop/product/J5.jpg" title="Bint Beef" alt="Bint Beef">
									</a>
									<a data-index="3" class="img thumbnail " data-image="image/demo/shop/product/J4.jpg" title="Bint Beef">
										<img src="image/demo/shop/product/J4.jpg" title="Bint Beef" alt="Bint Beef">
									</a>
								</div>

							</div>

							<div class="content-product-right col-sm-6 col-xs-12">
								<div class="title-product">
									<h1><%= p.getName() %></h1>
								</div>
								<!-- Review ---->
								<div class="box-review form-group">
									<div class="ratings">
										<div class="rating-box">
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
										</div>
									</div>

									<a class="reviews_button" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">0 reviews</a>	|
									<a class="write_review_button" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">Write a review</a>
								</div>
								
								<!-- Here is the Price -->
								<div class="product-label form-group">
									<div class="product_page_price price" itemprop="offerDetails" itemscope="" itemtype="http://data-vocabulary.org/Offer">
										<span class="price-new" itemprop="price">$<%= p.getMemberPrice() %></span>
										<span class="price-old">$<%= p.getNormalPrice() %></span>
									</div>
									<div class="stock"><span>Availability:</span> <span class="status-stock">In Stock</span></div>
								</div>

								<div class="product-box-desc">
									<div class="inner-box-desc">
										<div class="price-tax"><span>Ex Tax:</span> $60.00</div>
										<div class="reward"><span>Price in reward points:</span> 400</div>
										<div class="brand"><span>Brand:</span><a href="#">Apple</a>		</div>
										<div class="model"><span>Product Code:</span> Product 15</div>
										<div class="reward"><span>Reward Points:</span> 100</div>
									</div>
								</div>


								<div id="product">
									<h4>Available Options</h4>
									<div class="image_option_type form-group required">
										<label class="control-label">Colors</label>
										<ul class="product-options clearfix"id="input-option231">
											<li class="radio">
												<label>
													<input class="image_radio" type="radio" name="option[231]" value="33">
													<img src="image/demo/colors/blue.jpg" data-original-title="blue +$12.00" class="img-thumbnail icon icon-color">				<i class="fa fa-check"></i>
													<label> </label>
												</label>
											</li>
											<li class="radio">
												<label>
													<input class="image_radio" type="radio" name="option[231]" value="34">
													<img src="image/demo/colors/brown.jpg" data-original-title="brown -$12.00" class="img-thumbnail icon icon-color">				<i class="fa fa-check"></i>
													<label> </label>
												</label>
											</li>
											<li class="radio">
												<label>
													<input class="image_radio" type="radio" name="option[231]" value="35"> <img src="image/demo/colors/green.jpg"
													data-original-title="green +$12.00" class="img-thumbnail icon icon-color">				<i class="fa fa-check"></i>
													<label> </label>
												</label>
											</li>
											<li class="selected-option">
											</li>
										</ul>
									</div>

									<div class="box-checkbox form-group required">
										<label class="control-label">Checkbox</label>
										<div id="input-option232">
											<div class="checkbox">
												<label for="checkbox_1"><input type="checkbox" name="option[232][]" value="36" id="checkbox_1"> Checkbox 1 (+$12.00)</label>
											</div>
											<div class="checkbox">
												<label for="checkbox_2"><input type="checkbox" name="option[232][]" value="36" id="checkbox_2"> Checkbox 2 (+$36.00)</label>
											</div>
											<div class="checkbox">
												<label for="checkbox_3"><input type="checkbox" name="option[232][]" value="36" id="checkbox_3"> Checkbox 3 (+$24.00)</label>
											</div>
											<div class="checkbox">
												<label for="checkbox_4"><input type="checkbox" name="option[232][]" value="36" id="checkbox_4"> Checkbox 4 (+$48.00)</label>
											</div>
										</div>
									</div>
								
									<input type="hidden" name="id" value=<%= p.getId() %> />
									<div class="form-group box-info-product">
										<div class="option quantity">
											<div class="input-group quantity-control" unselectable="on" style="-webkit-user-select: none;">
												<label>Qty</label>
												<input class="form-control" type="text" name="qty"
												value="1">
												<input type="hidden" name="product_id" value="50">
												<span class="input-group-addon product_quantity_down">−</span>
												<span class="input-group-addon product_quantity_up">+</span>
											</div>
										</div>
										<div class="cart">
											<a href="buy.jsp?id=<%= p.getId() %>">ASD</a>
											<input type="button" data-toggle="tooltip" title="" value="Add to Cart777" class="btn btn-mega btn-lg" onclick="javascrtpt:window.location.href='buy.jsp?id=<%= p.getId() %>&qyt=<%= request.getParameter("qty") %>'">
											<!-- <input type="button" data-toggle="tooltip" title="" value="Add to Cart777" data-loading-text="Loading..." id="button-cart" class="btn btn-mega btn-lg" onclick="cart.add('42', '1');" data-original-title="Add to Cart"> -->
										</div>
										<div class="add-to-links wish_comp">
											<ul class="blank list-inline">
												<li class="wishlist">
													<a class="icon" data-toggle="tooltip" title=""
													onclick="wishlist.add('50');" data-original-title="Add to Wish List"><i class="fa fa-heart"></i>
													</a>
												</li>
												<li class="compare">
													<a class="icon" data-toggle="tooltip" title=""
													onclick="compare.add('50');" data-original-title="Compare this Product"><i class="fa fa-exchange"></i>
													</a>
												</li>
											</ul>
										</div>
									</div>

								</div>
								<!-- end box info product -->

							</div>
						</div>
					</div>

					<section class="col-lg-2 hidden-sm hidden-md hidden-xs slider-products">
						<div class="module col-sm-12 four-block">
							<div class="modcontent clearfix">
								<div class="policy-detail">
									<div class="banner-policy">
										<div class="policy policy1">
											<a href="#"> <span class="ico-policy">&nbsp;</span>	90 day
											<br> money back </a>
										</div>
										<div class="policy policy2">
											<a href="#"> <span class="ico-policy">&nbsp;</span>	In-store exchange </a>
										</div>
										<div class="policy policy3">
											<a href="#"> <span class="ico-policy">&nbsp;</span>	lowest price guarantee </a>
										</div>
										<div class="policy policy4">
											<a href="#"> <span class="ico-policy">&nbsp;</span>	shopping guarantee </a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<!-- Product Tabs -->
				<div class="producttab ">
	<div class="tabsslider  vertical-tabs col-xs-12">
		<ul class="nav nav-tabs col-lg-2 col-sm-3">
			<li class="active"><a data-toggle="tab" href="#tab-1">Description</a></li>
			<li class="item_nonactive"><a data-toggle="tab" href="#tab-review">Reviews (1)</a></li>
			<li class="item_nonactive"><a data-toggle="tab" href="#tab-4">Tags</a></li>
			<li class="item_nonactive"><a data-toggle="tab" href="#tab-5">Custom Tab</a></li>
		</ul>
		<div class="tab-content col-lg-10 col-sm-9 col-xs-12">
			<div id="tab-1" class="tab-pane fade active in">
				<p>Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmodtempor invidunt ut labore et doloremagna aliquyam erat, sed diam voluptua.</p>
				<p>At vero eos et accusam et justo duo dolores	et ea rebum. Stet clita kasd gubergren,no sea takimata sanctus est Lorem ipsumdolor sit amet. Lorem ipsum dolor sitamet, consetetur sadipscing elitr, seddiam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,sed diam voluptua. </p>
				<p>At vero eos et accusam et justo duo dolores
					et ea rebum. Stet clita kasd gubergren,
					no sea takimata sanctus est Lorem ipsum
					dolor sit amet. Lorem ipsum dolor sit
					amet, consetetur sadipscing elitr, sed
					diam nonumy eirmod tempor invidunt ut
					labore et dolore magna aliquyam erat,
					sed diam voluptua. At vero eos et accusam
					et justo duo dolores et ea rebum. Stet
					clita kasd gubergren, no sea takimata
					sanctus est Lorem ipsum dolor sit amet.
					<br>
				</p>

			</div>
			<div id="tab-review" class="tab-pane fade">
				<form>
					<div id="review">
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<td style="width: 50%;"><strong>Super Administrator</strong></td>
									<td class="text-right">29/07/2015</td>
								</tr>
								<tr>
									<td colspan="2">
										<p>Best this product opencart</p>
										<div class="ratings">
											<div class="rating-box">
												<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="text-right"></div>
					</div>
					<h2 id="review-title">Write a review</h2>
					<div class="contacts-form">
						<div class="form-group"> <span class="icon icon-user"></span>
							<input type="text" name="name" class="form-control" value="Your Name" onblur="if (this.value == '') {this.value = 'Your Name';}" onfocus="if(this.value == 'Your Name') {this.value = '';}">
						</div>
						<div class="form-group"> <span class="icon icon-bubbles-2"></span>
							<textarea class="form-control" name="text" onblur="if (this.value == '') {this.value = 'Your Review';}" onfocus="if(this.value == 'Your Review') {this.value = '';}">Your Review</textarea>
						</div>
						<span style="font-size: 11px;"><span class="text-danger">Note:</span>						HTML is not translated!</span>

						<div class="form-group">
						 <b>Rating</b> <span>Bad</span>&nbsp;
						<input type="radio" name="rating" value="1"> &nbsp;
						<input type="radio" name="rating"
						value="2"> &nbsp;
						<input type="radio" name="rating"
						value="3"> &nbsp;
						<input type="radio" name="rating"
						value="4"> &nbsp;
						<input type="radio" name="rating"
						value="5"> &nbsp;<span>Good</span>

						</div>
						<div class="buttons clearfix"><a id="button-review" class="btn buttonGray">Continue</a></div>
					</div>
				</form>
			</div>
			<div id="tab-4" class="tab-pane fade">
				<a href="#">Monitor</a>,
				<a href="#">Apple</a>
			</div>
			<div id="tab-5" class="tab-pane fade">
				<p>Lorem ipsum dolor sit amet, consetetur
					sadipscing elitr, sed diam nonumy eirmod
					tempor invidunt ut labore et dolore
					magna aliquyam erat, sed diam voluptua.
					At vero eos et accusam et justo duo
					dolores et ea rebum. Stet clita kasd
					gubergren, no sea takimata sanctus est
					Lorem ipsum dolor sit amet. Lorem ipsum
					dolor sit amet, consetetur sadipscing
					elitr, sed diam nonumy eirmod tempor
					invidunt ut labore et dolore magna aliquyam
					erat, sed diam voluptua. </p>
				<p>At vero eos et accusam et justo duo dolores
					et ea rebum. Stet clita kasd gubergren,
					no sea takimata sanctus est Lorem ipsum
					dolor sit amet. Lorem ipsum dolor sit
					amet, consetetur sadipscing elitr.</p>
				<p>Sed diam nonumy eirmod tempor invidunt
					ut labore et dolore magna aliquyam erat,
					sed diam voluptua. At vero eos et accusam
					et justo duo dolores et ea rebum. Stet
					clita kasd gubergren, no sea takimata
					sanctus est Lorem ipsum dolor sit amet.</p>
			</div>
		</div>
	</div>
</div>
				<!-- //Product Tabs -->

				<!-- Related Products -->
				<div class="related titleLine products-list grid module ">
	<h3 class="modtitle">Related Products  </h3>
	<div class="releate-products ">
		<div class="product-layout">
			<div class="product-item-container">
				<div class="left-block">
					<div class="product-image-container second_img ">
						<img  src="image/demo/shop/product/e11.jpg"  title="Apple Cinema 30&quot;" class="img-responsive" />
						<img  src="image/demo/shop/product/e12.jpg"  title="Apple Cinema 30&quot;" class="img_0 img-responsive" />
					</div>
					<!--Sale Label-->
					<span class="label label-sale">Sale</span>
					<!--full quick view block-->
					<a class="quickview iframe-link visible-lg" data-fancybox-type="iframe"  href="#">  Quickview</a>
					<!--end full quick view block-->
				</div>


				<div class="right-block">
					<div class="caption">
						<h4><a href="product.html">Apple Cinema 30&quot;</a></h4>
						<div class="ratings">
							<div class="rating-box">
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
							</div>
						</div>

						<div class="price">
							<span class="price-new">$74.00</span>
							<span class="price-old">$122.00</span>
							<span class="label label-percent">-40%</span>
						</div>
						<div class="description item-desc hidden">
							<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l..</p>
						</div>
					</div>

					  <div class="button-group">
						<button class="addToCart" type="button" data-toggle="tooltip" title="Add to Cart" onclick="cart.add('42', '1');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs">Add to Cart</span></button>
						<button class="wishlist" type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('42');"><i class="fa fa-heart"></i></button>
						<button class="compare" type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('42');"><i class="fa fa-exchange"></i></button>
					  </div>
				</div><!-- right block -->

			</div>
		</div>
		<div class="product-layout ">
			<div class="product-item-container">
				<div class="left-block">
					<div class="product-image-container second_img ">
						<img  src="image/demo/shop/product/11.jpg"  title="Apple Cinema 30&quot;" class="img-responsive" />
						<img  src="image/demo/shop/product/10.jpg"  title="Apple Cinema 30&quot;" class="img_0 img-responsive" />

					</div>
					<!--Sale Label-->
					<span class="label label-sale">Sale</span>
					<!--full quick view block-->
					<a class="quickview iframe-link visible-lg" data-fancybox-type="iframe"  href="#">  Quickview</a>
					<!--end full quick view block-->
				</div>


				<div class="right-block">
					<div class="caption">
						<h4><a href="product.html">Apple Cinema 30&quot;</a></h4>
						<div class="ratings">
							<div class="rating-box">
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
							</div>
						</div>

						<div class="price">
							<span class="price-new">$74.00</span>
							<span class="price-old">$122.00</span>
							<span class="label label-percent">-40%</span>
						</div>
						<div class="description item-desc hidden">
							<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l..</p>
						</div>
					</div>

					  <div class="button-group">
						<button class="addToCart" type="button" data-toggle="tooltip" title="Add to Cart" onclick="cart.add('42', '1');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs">Add to Cart</span></button>
						<button class="wishlist" type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('42');"><i class="fa fa-heart"></i></button>
						<button class="compare" type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('42');"><i class="fa fa-exchange"></i></button>
					  </div>
				</div><!-- right block -->

			</div>
		</div>
		<div class="product-layout ">
			<div class="product-item-container">
				<div class="left-block">
					<div class="product-image-container second_img ">
						<img  src="image/demo/shop/product/35.jpg"  title="Apple Cinema 30&quot;" class="img-responsive" />
						<img  src="image/demo/shop/product/34.jpg"  title="Apple Cinema 30&quot;" class="img_0 img-responsive" />
					</div>
					<!--Sale Label-->
					<span class="label label-sale">Sale</span>
					<!--full quick view block-->
					<a class="quickview iframe-link visible-lg" data-fancybox-type="iframe"  href="#">  Quickview</a>
					<!--end full quick view block-->
				</div>


				<div class="right-block">
					<div class="caption">
						<h4><a href="product.html">Apple Cinema 30&quot;</a></h4>
						<div class="ratings">
							<div class="rating-box">
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
							</div>
						</div>

						<div class="price">
							<span class="price-new">$74.00</span>
							<span class="price-old">$122.00</span>
							<span class="label label-percent">-40%</span>
						</div>
						<div class="description item-desc hidden">
							<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l..</p>
						</div>
					</div>

					  <div class="button-group">
						<button class="addToCart" type="button" data-toggle="tooltip" title="Add to Cart" onclick="cart.add('42', '1');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs">Add to Cart</span></button>
						<button class="wishlist" type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('42');"><i class="fa fa-heart"></i></button>
						<button class="compare" type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('42');"><i class="fa fa-exchange"></i></button>
					  </div>
				</div><!-- right block -->

			</div>
		</div>
		<div class="product-layout ">
			<div class="product-item-container">
				<div class="left-block">
					<div class="product-image-container second_img ">
						<img  src="image/demo/shop/product/14.jpg"  title="Apple Cinema 30&quot;" class="img-responsive" />
						<img  src="image/demo/shop/product/15.jpg"  title="Apple Cinema 30&quot;" class="img_0 img-responsive" />
					</div>
					<!--Sale Label-->
					<span class="label label-sale">Sale</span>
					<!--full quick view block-->
					<a class="quickview iframe-link visible-lg" data-fancybox-type="iframe"  href="#">  Quickview</a>
					<!--end full quick view block-->
				</div>


				<div class="right-block">
					<div class="caption">
						<h4><a href="product.html">Apple Cinema 30&quot;</a></h4>
						<div class="ratings">
							<div class="rating-box">
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
							</div>
						</div>

						<div class="price">
							<span class="price-new">$74.00</span>
							<span class="price-old">$122.00</span>
							<span class="label label-percent">-40%</span>
						</div>
						<div class="description item-desc hidden">
							<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l..</p>
						</div>
					</div>

					  <div class="button-group">
						<button class="addToCart" type="button" data-toggle="tooltip" title="Add to Cart" onclick="cart.add('42', '1');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs">Add to Cart</span></button>
						<button class="wishlist" type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('42');"><i class="fa fa-heart"></i></button>
						<button class="compare" type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('42');"><i class="fa fa-exchange"></i></button>
					  </div>
				</div><!-- right block -->

			</div>
		</div>
	</div>
</div>

			<!-- end Related  Products-->


			</div>


		</div>
		<!--Middle Part End-->
	</div>
	<!-- //Main Container -->


	<!-- Footer Container -->
	<footer class="footer-container">
		<!-- Footer Top Container -->
		<section class="footer-top">
			<div class="container content">
				<div class="row">
					<div class="col-sm-6 col-md-3 box-information">
						<div class="module clearfix">
							<h3 class="modtitle">Information</h3>
							<div class="modcontent">
								<ul class="menu">
									<li><a href="#">About Us</a></li>
									<li><a href="#">FAQ</a></li>
									<li><a href="#">Order history</a></li>
									<li><a href="#">Order information</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-3 box-service">
						<div class="module clearfix">
							<h3 class="modtitle">Customer Service</h3>
							<div class="modcontent">
								<ul class="menu">
									<li><a href="#">Contact Us</a></li>
									<li><a href="#">Returns</a></li>
									<li><a href="#">Site Map</a></li>
									<li><a href="#">My Account</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-3 box-account">
						<div class="module clearfix">
							<h3 class="modtitle">My Account</h3>
							<div class="modcontent">
								<ul class="menu">
									<li><a href="#">Brands</a></li>
									<li><a href="#">Gift Vouchers</a></li>
									<li><a href="#">Affiliates</a></li>
									<li><a href="#">Specials</a></li>
									<li><a href="#" target="_blank">Our Blog</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-3 collapsed-block ">
						<div class="module clearfix">
							<h3 class="modtitle">Contact Us	</h3>
							<div class="modcontent">
								<ul class="contact-address">
									<li><span class="fa fa-map-marker"></span> My Company, 42 avenue des Champs Elysées 75000 Paris France</li>
									<li><span class="fa fa-envelope-o"></span> Email: <a href="#"> sales@yourcompany.com</a></li>
									<li><span class="fa fa-phone">&nbsp;</span> Phone 1: 0123456789 <br>Phone 2: (123) 4567890</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-sm-12 collapsed-block footer-links">
						<div class="module clearfix">
							<div class="modcontent">
								<hr class="footer-lines">
								<div class="footer-directory-title">
									<h4 class="label-link">Top Stores : Brand Directory | Store Directory</h4>
									<ul class="footer-directory">
										<li>
											<h4>MOST SEARCHED KEYWORDS MARKET:</h4>
											<a href="#">Xiaomi Mi3</a> | <a href="#">Digiflip Pro XT 712 Tablet</a> | <a href="#">Mi 3 Phones</a> | <a href="#">View all</a></li>
										<li>
											<h4>MOBILES:</h4>
											<a href="#">Moto E</a> | <a href="#">Samsung Mobile</a> | <a href="#">Micromax Mobile</a> | <a href="#">Nokia Mobile</a> | <a href="#">HTC Mobile</a> | <a href="#">Sony Mobile</a> | <a href="#">Apple Mobile</a> | <a href="#">LG Mobile</a> | <a href="#">Karbonn Mobile</a> | <a href="#">View all</a></li>
										<li>
											<h4>CAMERA:</h4>
											<a href="#">Nikon Camera</a> | <a href="#">Canon Camera</a> | <a href="#">Sony Camera</a> | <a href="#">Samsung Camera</a> | <a href="#">Point shoot camera</a> | <a href="#">Camera Lens</a> | <a href="#">Camera Tripod</a> | <a href="#">Camera Bag</a> | <a href="#">View all</a></li>
										<li>
											<h4>LAPTOPS:</h4>
											<a href="#">Apple Laptop</a> | <a href="#">Acer Laptop</a> | <a href="#">Sony Laptop</a> | <a href="#">Dell Laptop</a> | <a href="#">Asus Laptop</a> | <a href="#">Toshiba Laptop</a> | <a href="#">LG Laptop</a> | <a href="#">HP Laptop</a> | <a href="#">Notebook</a> | <a href="#">View all</a></li>
										<li>
											<h4>TVS:</h4>
											<a href="#">Sony TV</a> | <a href="#">Samsung TV</a> | <a href="#">LG TV</a> | <a href="#">Panasonic TV</a> | <a href="#">Onida TV</a> | <a href="#">Toshiba TV</a> | <a href="#">Philips TV</a> | <a href="#">Micromax TV</a> | <a href="#">LED TV</a> | <a href="#">LCD TV</a> | <a href="#">Plasma TV</a> | <a href="#">3D TV</a> | <a href="#">Smart TV</a> | <a href="#">View all</a></li>
										<li>
											<h4>TABLETS:</h4>
											<a href="#">Micromax Tablets</a> | <a href="#">HCL Tablets</a> | <a href="#">Samsung Tablets</a> | <a href="#">Lenovo Tablets</a> | <a href="#">Karbonn Tablets</a> | <a href="#">Asus Tablets</a> | <a href="#">Apple Tablets</a> | <a href="#">View all</a></li>
										<li>
											<h4>WATCHES:</h4>
											<a href="#">FCUK Watches</a> | <a href="#">Titan Watches</a> | <a href="#">Casio Watches</a> | <a href="#">Fastrack Watches</a> | <a href="#">Timex Watches</a> | <a href="#">Fossil Watches</a> | <a href="#">Diesel Watches</a> | <a href="#">Luxury Watches</a> | <a href="#">View all</a></li>
										<li>
											<h4>CLOTHING:</h4>
											<a href="#">Shirts</a> | <a href="#">Jeans</a> | <a href="#">T shirts</a> | <a href="#">Kurtis</a> | <a href="#">Sarees</a> | <a href="#">Levis Jeans</a> | <a href="#">Killer Jeans</a> | <a href="#">Pepe Jeans</a> | <a href="#">Arrow Shirts</a> | <a href="#">Ethnic Wear</a> | <a href="#">Formal Shirts</a> | <a href="#">Peter England Shirts</a> | <a href="#">View all</a></li>
										<li>
											<h4>FOOTWEAR:</h4>
											<a href="#">Shoes</a> | <a href="#">Casual Shoes</a> | <a href="#">Adidas Shoes</a> | <a href="#">Gas Shoes</a> | <a href="#">Puma Shoes</a> | <a href="#">Reebok Shoes</a> | <a href="#">Woodland Shoes</a> | <a href="#">Red tape Shoes</a> | <a href="#">Nike Shoes</a> | <a href="#">View all</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /Footer Top Container -->

		<!-- Footer Bottom Container -->
		<div class="footer-bottom-block ">
			<div class=" container">
				<div class="row">
					<div class="col-sm-5 copyright-text">Copyright &copy; 2017.Company name All rights reserved.</div>
					<div class="col-sm-7">
						<div class="block-payment text-right"><img src="image/demo/content/payment.png" alt="payment" title="payment" ></div>
					</div>
					<!--Back To Top-->
					<div class="back-to-top"><i class="fa fa-angle-up"></i><span> Top </span></div>

				</div>
			</div>
		</div>
		<!-- /Footer Bottom Container -->


	</footer>
	<!-- //end Footer Container -->

    </div>


	<!-- Cpanel Block -->
	<div id="sp-cpanel_btn" class="isDown visible-lg">
	<i class="fa fa-cog"></i>
</div>

<div id="sp-cpanel" class="sp-delay">
	<h2 class="sp-cpanel-title"> Demo Options <span class="sp-cpanel-close"> <i class="fa fa-times"> </i></span></h2>
	<div id="sp-cpanel_settings">
		<div class="panel-group">
			<label>Color Scheme</label>
			<div class="group-schemes" >
				<span data-scheme="default"  class="item_scheme selected"><span style="background: #e8622d;"></span></span>
				<span data-scheme="blue" class="item_scheme"><span style="background: #478bca;"></span></span>
				<span data-scheme="boocdo"  class="item_scheme"><span style="background: #e54e4e;"></span></span>
				<span data-scheme="cyan" class="item_scheme"><span style="background: #1ea181;"></span></span>
				<span data-scheme="green" class="item_scheme "><span style="background: #52a633;"></span></span>

			 </div>
		</div>

		<div class="panel-group ">
			<label>Header style</label>
			<div class="group-boxed">
				<select id="change_header_type" name="cpheaderstype" class="form-control" onchange="headerTypeChange(this.value);">
					<option value="header-home1" >Header 1</option>
					<option value="header-home2" >Header 2</option>
					<option value="header-home3" >Header 3</option>
					<option value="header-home4" >Header 4</option>
				</select>
			</div>
		</div>


		<div class="panel-group ">
			<label>Layout Box</label>
			<div class="group-boxed">
				<select id="cp-layoutbox" name="cplayoutbox" class="form-control" onchange="changeLayoutBox(this.value);">
					<option value="full">Wide</option>
					<option value="boxed">Boxed</option>
					<option value="iframed">Iframed</option>
					<option value="rounded">Rounded</option>
				</select>
			</div>
		</div>

        <div class="panel-group">
			<label>Body Image</label>

			<div class="group-pattern">
								<div data-pattern="28"  class="img-pattern"><img src="image/theme/patterns/28.png" alt="pattern 28"></div>
								<div data-pattern="29"  class="img-pattern"><img src="image/theme/patterns/29.png" alt="pattern 29"></div>
								<div data-pattern="30"  class="img-pattern"><img src="image/theme/patterns/30.png" alt="pattern 30"></div>
								<div data-pattern="31"  class="img-pattern"><img src="image/theme/patterns/31.png" alt="pattern 31"></div>
								<div data-pattern="32"  class="img-pattern"><img src="image/theme/patterns/32.png" alt="pattern 32"></div>
								<div data-pattern="33"  class="img-pattern"><img src="image/theme/patterns/33.png" alt="pattern 33"></div>
								<div data-pattern="34"  class="img-pattern"><img src="image/theme/patterns/34.png" alt="pattern 34"></div>
								<div data-pattern="35"  class="img-pattern"><img src="image/theme/patterns/35.png" alt="pattern 35"></div>
								<div data-pattern="36"  class="img-pattern"><img src="image/theme/patterns/36.png" alt="pattern 36"></div>
								<div data-pattern="37"  class="img-pattern"><img src="image/theme/patterns/37.png" alt="pattern 37"></div>
								<div data-pattern="38"  class="img-pattern"><img src="image/theme/patterns/38.png" alt="pattern 38"></div>
								<div data-pattern="39"  class="img-pattern"><img src="image/theme/patterns/39.png" alt="pattern 39"></div>
								<div data-pattern="40"  class="img-pattern"><img src="image/theme/patterns/40.png" alt="pattern 40"></div>
								<div data-pattern="41"  class="img-pattern"><img src="image/theme/patterns/41.png" alt="pattern 41"></div>
								<div data-pattern="42"  class="img-pattern"><img src="image/theme/patterns/42.png" alt="pattern 42"></div>
								<div data-pattern="43"  class="img-pattern"><img src="image/theme/patterns/43.png" alt="pattern 43"></div>
								<div data-pattern="44"  class="img-pattern"><img src="image/theme/patterns/44.png" alt="pattern 44"></div>
								<div data-pattern="45"  class="img-pattern"><img src="image/theme/patterns/45.png" alt="pattern 45"></div>
							</div>
			<p class="label-sm">Background only applies for Boxed,Framed, Rounded Layout</p>
		</div>

		<div class="reset-group">
		    <a href="index.html" class="btn btn-success " onclick="ResetAll()">Reset</a>
		</div>

	</div>

</div>



<link rel='stylesheet' property='stylesheet'  href='css/themecss/cpanel.css' type='text/css' media='all' />


	<!-- Preloading Screen -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	 </div>
	<!-- End Preloading Screen -->

<!-- Include Libs & Plugins
	============================================ -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript" src="js/themejs/libs.js"></script>
	<script type="text/javascript" src="js/unveil/jquery.unveil.js"></script>
	<script type="text/javascript" src="js/countdown/jquery.countdown.min.js"></script>
	<script type="text/javascript" src="js/dcjqaccordion/jquery.dcjqaccordion.2.8.min.js"></script>
	<script type="text/javascript" src="js/datetimepicker/moment.js"></script>
	<script type="text/javascript" src="js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui/jquery-ui.min.js"></script>


	<!-- Theme files
	============================================ -->


	<script type="text/javascript" src="js/themejs/so_megamenu.js"></script>
	<script type="text/javascript" src="js/themejs/addtocart.js"></script>
	<script type="text/javascript" src="js/themejs/application.js"></script>
	<script type="text/javascript" src="js/themejs/cpanel.js"></script>

</body>
</html>
