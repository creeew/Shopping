<%@ page language="java" contentType="text/html; charset=UTF-8" import="top.sadboy.shopping.*"
    pageEncoding="UTF-8"%>

<%@ include file="sessioncheck.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="#" type="image/png">

<title>Administrator</title>

<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">

<script type="text/javascript">
<!--
	function changeFrameHeight() {
		var ifm = document.getElementById("content");
		ifm.height = document.documentElement.clientHeight;
	}
	window.onresize = function() {
		changeFrameHeight();
	}
	-->
</script>
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a href="#"><img src="images/logo.png" alt=""></a>
        </div>

        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">John Doe</a></h4>
                        <span>"Hello There..."</span>
                    </div>
                </div>

                <h5 class="left-nav-title">Account Information</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                    <li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
                    <li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
                    <li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                </ul>
            </div>

			<!--sidebar nav start-->
			<ul class="nav nav-pills nav-stacked custom-nav">
<!-- 				<li class="menu-list"><a href="index.html"><i
						class="fa fa-home"></i> <span>USER</span></a>
					<ul class="sub-menu-list">
						<li><a href="userlist.jsp"> User List</a></li>
						<li class="active"><a href="responsive_table.html">
								Responsive Table</a></li>
						<li><a href="#"> Dashboard 2</a></li>
					</ul>
				</li> -->

				<li class="menu-list"><a href="#"><i
						class="fa fa-th-list"></i> <span>User</span></a>
					<ul class="sub-menu-list">
						<li><a href="userlist1.jsp" target="content">User List</a></li>
						<li><a href="userlist1.jsp"> UserList1_Page</a></li>
						<li><a href="userlist2.jsp"> UserList2_StylePage</a></li>
					</ul>
				</li>

				<li class="menu-list"><a href="index.jsp"><i
						class="fa fa-home"></i> <span>Category</span></a>
					<ul class="sub-menu-list">
						<li><a href="categorylist.jsp" target="content"> Category List</a></li>
						<li><a href="categoryadd.jsp" target="content"> Add Category</a></li>
					</ul>
				</li>

				<li class="menu-list"><a href="#"><i
						class="fa fa-th-list"></i> <span>Porduct</span></a>
					<ul class="sub-menu-list">
						<li><a href="productlist.jsp" target="content"> Product List</a></li>
						<li><a href="productadd.jsp" target="content"> Add Product</a></li>
						<li><a href="productsearch.jsp" target="content"> Product Search</a></li>
					</ul>
				</li>
				
				<li class="menu-list"><a href="#"><i
						class="fa fa-th-list"></i> <span>Order</span></a>
					<ul class="sub-menu-list">
						<li><a href="orderlist.jsp" target="content">Order List</a></li>
						<li><a href="showproductsaleschart.jsp" target="content">Order Report</a></li>
						<li><a href="userlist1.jsp" target="content">Finished Order</a></li>
						<li><a href="userlist1.jsp" target="content">Unfinished Order</a></li>
					</ul>
				</li>
				
			</ul>
			<!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->

    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

        <!--toggle button start-->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>
        <!--toggle button end-->

        <!--notification menu start -->
        <div class="menu-right">
            <ul class="notification-menu">
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="images/photos/user-avatar.png" alt="" />
                        John Doe
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <li><a href="#"><i class="fa fa-user"></i>  Profile</a></li>
                        <li><a href="#"><i class="fa fa-cog"></i>  Settings</a></li>
                        <li><a href="#"><i class="fa fa-sign-out"></i> Log Out</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <!--notification menu end -->

        </div>
        <!-- header section end-->

		
		<!-- frame start -->
        <div>
          <iframe name="content" id="content" scrolling="" onload="changeFrameHeight()" frameborder="0" width="100%"></iframe>
        </div>
		<!-- frame end -->
		
        <!-- <footer>
            2017 &copy; sadboy
        </footer> -->
    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>

</body>
</html>