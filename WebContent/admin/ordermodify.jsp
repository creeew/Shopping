<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="top.sadboy.shopping.*"%>
<%@ page import="java.util.*"%>

    
<%
request.setCharacterEncoding("utf-8");
String strStatus = request.getParameter("status");
int status = Integer.parseInt(strStatus);
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMrg.getInstance().loadById(id);
so.setStatus(status);
OrderMrg.getInstance().updateStatus(so);
response.sendRedirect("orderlist.jsp");
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>