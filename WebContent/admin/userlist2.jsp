<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="top.sadboy.shopping.*"%>
<%@ page import="java.util.*"%>

<%
	List<User> users = UserManager.getUsers();
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="#" type="image/png">

<title>Administrator_UserList2</title>

<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">

	<section> <!-- left side start-->
	<div class="left-side sticky-left-side">

		<!--logo and iconic logo start-->
		<div class="logo">
			<a href="#"><img src="images/logo.png" alt=""></a>
		</div>

		<div class="left-side-inner">

			<!-- visible to small devices only -->
			<div class="visible-xs hidden-sm hidden-md hidden-lg">
				<div class="media logged-user">
					<img alt="" src="images/photos/user-avatar.png"
						class="media-object">
					<div class="media-body">
						<h4>
							<a href="#">John Doe</a>
						</h4>
						<span>"Hello There..."</span>
					</div>
				</div>

				<h5 class="left-nav-title">Account Information</h5>
				<ul class="nav nav-pills nav-stacked custom-nav">
					<li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
					<li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
					<li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign
								Out</span></a></li>
				</ul>
			</div>

			<!--sidebar nav start-->
			<ul class="nav nav-pills nav-stacked custom-nav">
				<li class="menu-list"><a href="index.html"><i
						class="fa fa-home"></i> <span>USER</span></a>
					<ul class="sub-menu-list">
						<li><a href="userlist.jsp"> User List</a></li>
						<li class="active"><a href="responsive_table.html">
								Responsive Table</a></li>
						<!-- <li><a href="#"> Dashboard 2</a></li> -->
					</ul></li>

				<li class="menu-list nav-active"><a href="#"><i
						class="fa fa-th-list"></i> <span>Data Tables</span></a>
					<ul class="sub-menu-list">
						<li><a href="userlist1.jsp"> User List1</a></li>
						<li><a href="userlist2.jsp"> User List2</a></li>
					</ul></li>

				<li class="menu-list"><a href="index.html"><i
						class="fa fa-home"></i> <span>Dashboard</span></a>
					<ul class="sub-menu-list">
						<li><a href="#"> Dashboard 1</a></li>
						<li><a href="#"> Dashboard 2</a></li>
					</ul></li>

				<li class="menu-list nav-active"><a href="#"><i
						class="fa fa-th-list"></i> <span>USER1</span></a>
					<ul class="sub-menu-list">
						<li class="active"><a href="userlist.jsp"> Basic Table</a></li>
					</ul></li>
			</ul>
			<!--sidebar nav end-->

		</div>
	</div>
	<!-- left side end--> <!-- main content start-->
	<div class="main-content">

		<!-- header section start-->
		<div class="header-section">

			<!--toggle button start-->
			<a class="toggle-btn"><i class="fa fa-bars"></i></a>
			<!--toggle button end-->

			<!--notification menu start -->
			<div class="menu-right">
				<ul class="notification-menu">
					<li><a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown"> <img
							src="images/photos/user-avatar.png" alt="" /> John Doe <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
							<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
							<li><a href="#"><i class="fa fa-sign-out"></i> Log Out</a></li>
						</ul></li>

				</ul>
			</div>
			<!--notification menu end -->

		</div>
		<!-- header section end-->

		<!--body wrapper start-->

		<div class="wrapper">
			<div class="">
				<section class="panel"> <!-- <header class="panel-heading">
                        Hover Table
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                             </span>
                    </header> -->
				<div class="panel-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>Username</th>
								<th>Phone</th>
								<th>Address</th>
								<th>Register Date</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Iterator it = users.iterator(); it.hasNext();) {
									User u = (User) it.next();
							%>
							<tr>
								<td><%=u.getId()%></td>
								<td><%=u.getUsername()%></td>
								<td><%=u.getPhone()%></td>
								<td><%=u.getAddr()%></td>
								<td><%=u.getRdate()%></td>
								<td><a href="userdelete.jsp?id=<%= u.getId() %>" class="btn">Delete</a></td>
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
			<!--body wrapper end-->

			<!-- <footer>
            2017 &copy; sadboy
        </footer> -->
		</div>

		<div class="panel-body">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>Phone</th>
						<th>Address</th>
						<th>Register Date</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Iterator it = users.iterator(); it.hasNext();) {
							User u = (User) it.next();
					%>
					<tr>
						<td><%=u.getId()%></td>
						<td><%=u.getUsername()%></td>
						<td><%=u.getPhone()%></td>
						<td><%=u.getAddr()%></td>
						<td><%=u.getRdate()%></td>
					</tr>
					<%
						}
					%>
					<tr>

					</tr>
				</tbody>
			</table>
		</div>

		<!--body wrapper end-->

		<!-- <footer>
            2017 &copy; sadboy
        </footer> -->
	</div>
	<!-- main content end--> </section>

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