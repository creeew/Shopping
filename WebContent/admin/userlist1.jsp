<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="top.sadboy.shopping.*"%>
<%@ page import="java.util.*"%>
<%@ include file="sessioncheck.jsp" %>

<%
	List<User> users = User.getUsers();
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
								<td><a href="delete.jsp?id=<%=u.getId()%>" class="btn">Delete</a></td>
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