<%@page import="top.sadboy.shopping.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>     

<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>  
   
 <br>  
  --------------直接下载------------  
     <br>  
        <form action="FileUpload" method="get">  
            <input type="hidden" name="fileName" value="<%= id + ".jpg" %>" />  
            <input type="submit" value="下载:<%= id + ".jpg" %>" />  
        </form>  
     <br>  
</body>  
</html>