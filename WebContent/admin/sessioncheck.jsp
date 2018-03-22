<%@ page language="java" contentType="text/html; charset=UTF-8" import="top.sadboy.shopping.*"
    pageEncoding="UTF-8"%>

<%
User uu = (User)session.getAttribute("admin");

if (uu == null) {
	out.println("Respect My Authority");
	return;
}
%> 