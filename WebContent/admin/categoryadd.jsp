<%@page import="top.sadboy.shopping.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="sessioncheck.jsp" %>	
	

<%!
String title = "";
%>

<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String strPid = request.getParameter("pid");
int pid = 0;
if (strPid != null) {
	try {
		pid = Integer.parseInt(strPid);
	} catch (NumberFormatException e){
		e.printStackTrace();
	}
}

if (pid == 0) {
	title = "Add Root Category";
} else {
	title = "Add Child Category";
}

if (action != null && action.equals("add")) {
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	Category c = new Category();
	c.setName(name);
	c.setDescr(descr);
	if (pid == 0) {
		c.addTopCategory(name, descr);
		out.println("Add TOP Success!");
	} else {
		/* c.addChildCategory(pid, name, descr); */
		Category parent = Category.loadById(pid);
		Category child = new Category();
		child.setId(-1);
		child.setName(name);
		child.setDescr(descr);
		child.setPid(pid);
		parent.addChild(child);
		out.println("Add CHILD Success!");
	}
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/semantic.css">
<script src="../scripts/jquery-3.2.1.min.js"></script>
<script src="../scripts/semantic.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="ui container vertical segment">
		<center><%= title %></center>
		<form class="ui form segment" action="categoryadd.jsp" method="post">
			<input type="hidden" name="action" value="add" />
			<input type="hidden" name="pid" value="<%= pid %>" />
			<div class="field">

				<label>Category Name</label> <input placeholder="Category Name"
					name="name" id="" type="text" value="">
			</div>

			<div class="field">
				<label>Category Describe</label>
				<textarea rows="8" cols="40" name="descr" id=''></textarea>
			</div>

			<button type="submit" name="button" class="ui grey button">Submit</button>
			<!-- <div class="ui primary submit button" onclick="login()">Submit</div> -->
			<!-- <div class="ui primary submit button" type="submit">Submit</div> -->
			<div class="ui reset button">Reset</div>
		</form>
	</div>
</body>
</html>