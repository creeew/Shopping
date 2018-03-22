<%@page import="java.sql.Timestamp"%>
<%@page import="top.sadboy.shopping.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="cart" class="top.sadboy.shopping.Cart" scope="session"></jsp:useBean>    
    
<%
User u = (User)session.getAttribute("user");
if (u == null) {
	/* 用户执迷不悟，不肯注册，就new个id为-1的user出来，用来表示不注册购买的用户 */
	out.println("You can get a member price if you have a account.");
	out.println("<a href=login.jsp>Login</a>");
	u = new User();
	u.setId(-1);
}
%>    
    
<%
String addr = request.getParameter("addr");
SalesOrder so = new SalesOrder();
so.setCart(cart);
so.setAddr(addr);
so.setUser(u);
so.setoDate(new Timestamp(System.currentTimeMillis()));
so.setStatus(0);
so.save();
%>    
    
    <center>
    	Order has been submitted successfully,thanks for you order.
    </center>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>