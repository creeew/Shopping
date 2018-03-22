<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="top.sadboy.shopping.*" %>    
    
<%
User u = (User)session.getAttribute("user");
if (u == null) {
	out.println("You haven't logged yet!");
	return;
}
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="usermodify.jsp">Modify Information</a>
	<br>
	<a href="pwdmodify.jsp">Modify Password</a>
</body>
</html>