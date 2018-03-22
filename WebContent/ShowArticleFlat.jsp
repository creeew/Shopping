<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	/*
	这里也可以catch到异常，不过JSP会帮我们handle，如果在执行过程出现了exception，连接没有关闭，还是在这里直接写catch好
	如果程序写的十分robust，那也可以不要catch
	*/
	int pageSize = 3;
	String strPageNo = request.getParameter("pageNo");
	int pageNo = 0;
	if (strPageNo == null || strPageNo.equals("")) {
		pageNo = 1;
	} else {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
		if (pageNo <= 0) {
			out.println("SB");
			return;
		}
	}
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=zxc123";
	Connection conn = DriverManager.getConnection(url);
	Statement stmtCount = conn.createStatement();
	Statement stmt = conn.createStatement();
  	ResultSet rs1 = stmtCount.executeQuery("select count(*) from article where pid = 0");
	rs1.next();
	int totalRecords = rs1.getInt(1);
	int totalPages = totalRecords % pageSize == 0 ? totalRecords / pageSize : (totalRecords / pageSize) + 1;
	if (pageNo > totalPages) {
		pageNo = totalPages;
	}
	int begin_PageNo = (pageNo - 1) * pageSize;
	ResultSet rs = stmt
			.executeQuery("select * from article where pid = 0 order by pdate desc limit " + begin_PageNo + " , " + pageSize);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SWAG_f</title>
</head>
<body>

	<a href="Post.jsp">POST</a>
	<table border="1">

		<%
			while (rs.next()) {
		%>
		<tr>
			<td><a href='ShowArticleDetail.jsp?id=<%=rs.getInt("id")%>'><%=rs.getString("title")%></a>
			</td>
		</tr>

		<%
			}
		%>

	</table>
	<%
		for (int i=1; i<=totalPages; i++) {
	%>
			<a href='ShowArticleFlat.jsp?pageNo=<%= i %>'><%= i %></a>
	<%
		}
	%>
		<br>
		TotalPages <%= totalPages %>
		<br>
		CurrentPage <%= pageNo %>
		<br>
		
		<form name="form1" action="ShowArticleFlat.jsp">
			<select name="pageNo" onChange="document.form1.submit()">
				<%
				for (int i=1; i<=totalPages; i++) {
				%>
					<option value=<%= i %> <%= (pageNo == i) ? "selected" : "" %>>
						Page <%= i %>
					</option>
				<%	
				}
				%>
			</select>
		</form>
		
		<form name="form2" action="ShowArticleFlat.jsp">
			<input name="pageNo" type="text" size=4 value="<%= pageNo %>"/>
			<input type="submit" value="go"/>
		</form>
		
		<%
			rs1.close();
			rs.close();
			stmtCount.close();
			stmt.close();
			conn.close();
		%>
</body>
</html>