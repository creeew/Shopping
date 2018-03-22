<%@page import="top.sadboy.shopping.Category"%>
<%@page import="top.sadboy.shopping.ProductMrg"%>
<%@page import="java.sql.Timestamp, java.util.*"%>
<%@page import="top.sadboy.shopping.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
	private static final int PAGE_SIZE = 5;
	int pageCount = 100;
%>

<%
request.setCharacterEncoding("utf-8");
String action = request.getParameter("action");

/* 
if (action != null && action.equals("complexsearch")) {
	<!-- 为了让complexsearch的处理跳转的另一个页面，通过Jsp forward 来传输该页面中存储的信息 -->
	<jsp:forward page="complexsearchresult.jsp"></jsp:forward>
}

if (action != null && action.equals("simplesearch")) {
	<jsp:forward page="simplesearchresult.jsp"></jsp:forward>
} 
*/

%>

<%
	List<Category> categories = Category.getCategorys();
	List<Product> products = new ArrayList<Product>();
	String keyWord = null;
	double lowMemberPrice = -1;
	double highMemberPrice = -1;
	double lowNormalPrice = -1;
	double highNormalPrice = -1;
	String strStartDate = null;
	String strEndDate = null;
	int categoryId = -1;
	String strCategoryIdQuery = "";
	
	String strPageNo = request.getParameter("pageno");
	int pageNo = 1;
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
			e.printStackTrace();
		}
	}
	
	if (pageNo < 1) {
		pageNo = 1;
	}
	if (pageNo > pageCount) {
		pageNo = pageCount;
	}
	
%>

<%
	if (action != null && action.trim().equals("complexsearch")) {
		keyWord = request.getParameter("keyword");
		lowMemberPrice = -1;
		highMemberPrice = -1;
		lowNormalPrice = -1;
		highNormalPrice = -1;
		categoryId = Integer.parseInt(request.getParameter("categoryid"));
		int[] idArray;
		if (categoryId == 0) {
			idArray = null;
		} else {
			idArray = new int[1];
			idArray[0] = categoryId;
		}
		Timestamp startDate;
		Timestamp endDate;
		strStartDate = request.getParameter("startdate");
		strEndDate = request.getParameter("enddate");
		if (strStartDate == null || strStartDate.trim().equals("")) {
			startDate = null;
		} else {
			startDate = Timestamp.valueOf(strStartDate);
		}
		if (strEndDate == null || strEndDate.trim().equals("")) {
			endDate = null;
		} else {
			endDate = Timestamp.valueOf(strEndDate);
		}

		try {
			lowMemberPrice = Double.parseDouble(request.getParameter("lmprice"));
			highMemberPrice = Double.parseDouble(request.getParameter("hmprice"));
			lowNormalPrice = Double.parseDouble(request.getParameter("lnprice"));
			highNormalPrice = Double.parseDouble(request.getParameter("hnprice"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		products = new ArrayList<Product>();
		pageCount = ProductMrg.getInstance().findProducts(products, idArray, keyWord, lowMemberPrice,
				highMemberPrice, lowNormalPrice, highNormalPrice, startDate, endDate, pageNo, PAGE_SIZE);
	}
%>

<%

if (action != null && action.trim().equals("simplesearch")) {
	strCategoryIdQuery = "";
	String[] strCategoryIds = request.getParameterValues("categoryid");
	keyWord = request.getParameter("keyword");
	int[] idArray;
	if (strCategoryIds == null || strCategoryIds.length == 0) {
		idArray = null;
	} else {
		idArray = new int[strCategoryIds.length];
		for (int i=0; i<strCategoryIds.length; i++) {
			strCategoryIdQuery += "&categoryid=" + strCategoryIds[i];
		}
		
		for (int i = 0; i<strCategoryIds.length; i++) {
			idArray[i] = Integer.parseInt(strCategoryIds[i]);
		}
		
		products = new ArrayList<Product>();
		pageCount = ProductMrg.getInstance().findProducts(products, idArray, keyWord, -1,
				-1, -1, -1, null, null, pageNo, PAGE_SIZE);
	}
}
%>

<%
if (action != null && (action.equals("complexsearch") || action.equals("simplesearch"))) {
	%>
	<link href="css/style.css" rel="stylesheet">
<center>
	<section class="panel">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Describe</th>
					<th>Normal Price</th>
					<th>Member Price</th>
					<th>Up Date</th>
					<th>Category ID</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Iterator<Product> it = products.iterator(); it.hasNext();) {
							Product p = it.next();
				%>
				<tr>
					<td><%=p.getId()%></td>
					<td><%=p.getName()%></td>
					<td><%=p.getDescr()%></td>
					<td><%=p.getNormalPrice()%></td>
					<td><%=p.getMemberPrice()%></td>
					<td><%=p.getPdate()%></td>
					<td><%=p.getCategoryId()%></td>
				</tr>
				<%
					}
				%>
				<tr>
				</tr>
			</tbody>
		</table>
	</section>
	Total Page : <%= pageCount %>
	<br>
	Current Page : <%= pageNo %>
	<br>
	
	<%
	if (action != null && action.equals("complexsearch")) {
	%>
		<a href="productsearch.jsp?action=<%= action %>&pageno=<%= pageNo - 1 %>&keyword=<%= keyWord %>
		&lmprice=<%= lowMemberPrice %>&hmprice=<%= highMemberPrice %>&lnprice=<%= lowNormalPrice %>
		&hnprice=<%= highNormalPrice %>&categoryid=<%= categoryId %>&startdate=<%= strStartDate %>
		&enddate=<%= strEndDate %>">Last Page</a>
		&nbsp;&nbsp;&nbsp;
		
		<a href="productsearch.jsp?action=<%= action %>&pageno=<%= pageNo + 1 %>&keyword=<%= keyWord %>
		&lmprice=<%= lowMemberPrice %>&hmprice=<%= highMemberPrice %>&lnprice=<%= lowNormalPrice %>
		&hnprice=<%= highNormalPrice %>&categoryid=<%= categoryId %>&startdate=<%= strStartDate %>
		&enddate=<%= strEndDate %>">Next Page</a>
		&nbsp;&nbsp;&nbsp;
	<%	
	}
	%>
	
	<%
	if (action != null && action.equals("simplesearch")) {
	%>
		<a href="productsearch.jsp?action=<%= action %>&pageno=<%= pageNo - 1 %>&keyword=<%= keyWord %>
		<%= strCategoryIdQuery %>">Last Page</a>
		&nbsp;&nbsp;&nbsp;
		
		<a href="productsearch.jsp?action=<%= action %>&pageno=<%= pageNo + 1 %>&keyword=<%= keyWord %>
		<%= strCategoryIdQuery %>">Next Page</a>
		&nbsp;&nbsp;&nbsp;
	<%	
	}
	%>
	
</center>
	<%
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
		<center>
			<h3>Product Simple Search</h3>
		</center>
		<form class="ui form segment" action="productsearch.jsp" method="post">
			<input type="hidden" name="action" value="simplesearch" />
			<div class="field">
			<label>Category</label>
			<%
			for (Iterator<Category> it = categories.iterator(); it.hasNext();) {
				Category c = it.next();
				if (c.isLeaf()) {
			%>
				<input type="checkbox" name="categoryid" value="<%= c.getId() %>"> <%= c.getName() %>
				&nbsp;
			<%	
				}
			}
			%>
			</div>
			
			<div class="field">
				<label>Key Word</label> <input placeholder="Key Word" name="keyword" id="" type="text" value="">
			</div>
			<button type="submit" name="button" class="ui grey button">Search</button>
		</form>
		
		<center>
			<h2>Product Complex Search</h2>
		</center>
		<form class="ui form segment" action="productsearch.jsp" method="post">
			<input type="hidden" name="action" value="complexsearch" />
			<div class="field">
				<label>Key Word</label> <input placeholder="Key Word" name="keyword"
					id="" type="text" value="">
			</div>

			<div class="two fields">
				<div class="field">
					<label>Low Normal Price</label> <input
						placeholder="Low Normal Price" name="lnprice" id="" type="text"
						value="">
				</div>

				<div class="field">
					<label>High Normal Price</label> <input
						placeholder="High Normal Price" name="hnprice" id="" type="text"
						value="">
				</div>
			</div>

			<div class="two fields">
				<div class="field">
					<label>Low Member Price</label> <input
						placeholder="Low Member Price" name="lmprice" id="" type="text"
						value="">
				</div>

				<div class="field">
					<label>High Member Price</label> <input
						placeholder="High Member Price" name="hmprice" id="" type="text"
						value="">
				</div>
			</div>

			<div class="field">
				<label>Category</label>
				<select name="categoryid">
					<option value="0">All</option>
					<%
						for (Iterator<Category> it = categories.iterator(); it.hasNext();) {
							Category c = it.next();
							String preStr = "";
							for (int i = 1; i < c.getGrade(); i++) {
								preStr += "--";
							}
					%>
					<option value="<%=c.getId()%>"><%=preStr + c.getName()%></option>
					<%
						}
					%>

				</select>
			</div>

			<div class="two fields">
				<div class="field">
					<label>Product Start Date</label> <input placeholder="Start Date"
						name="startdate" id="" type="text" value="">
				</div>

				<div class="field">
					<label>Product End Date</label> <input placeholder="End Date"
						name="enddate" id="" type="text" value="">
				</div>
			</div>

			<button type="submit" name="button" class="ui grey button">Submit</button>
			<!-- <div class="ui primary submit button" onclick="login()">Submit</div> -->
			<!-- <div class="ui primary submit button" type="submit">Submit</div> -->
			<div class="ui reset button">Reset</div>
		</form>
	</div>

</body>
</html>