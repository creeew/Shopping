<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="top.sadboy.shopping.*" %>
<%@ page import="java.util.*" %>    

<%
List<User> users = User.getUsers();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
<title>Administrator</title>
</head>
<body>
	
	        <div class="wrapper">
            <div class="">
                <section class="panel">
                    <!-- <header class="panel-heading">
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
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td colspan="2">Larry the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Jane Doe</td>
                                <td>Mosa</td>
                                <td>@twitter</td>
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
            for (Iterator it = users.iterator(); it.hasNext(); ) {
            	User u = (User)it.next();
            %>	
            	<tr>
            		<td><%= u.getId() %></td>
            		<td><%= u.getUsername() %></td>
            		<td><%= u.getPhone() %></td>
            		<td><%= u.getAddr() %></td>
            		<td><%= u.getRdate() %></td>
            	</tr>
            <%
            }
            %>
            <tr>
            
            </tr>
            </tbody>
        </table>
    </div>

</body>
</html>