<%@page import="top.sadboy.shopping.CartItem"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 这个在cart.jsp页面中修改购买product的数量，点checkout就到这里 -->
    
<jsp:useBean id="cart" class="top.sadboy.shopping.Cart" scope="session"></jsp:useBean>    
    
<%
List<CartItem> items = cart.getItems();
for (int i=0; i<items.size(); i++) {
	CartItem ci = items.get(i);
	String strCount = request.getParameter("p" + ci.getProductId());
	if (strCount != null && !strCount.trim().equals("")) {
		ci.setCount(Integer.parseInt(strCount));
	}
}

response.sendRedirect("cart.jsp");
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