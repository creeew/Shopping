<%@ page language="java" contentType="text/html; charset=UTF-8" import="top.sadboy.shopping.*"
    pageEncoding="UTF-8"%>

<%
User u = (User)session.getAttribute("user");
if (u == null) {
	out.println("You haven't logged yet!");
	return;
}
%>

<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
if (action != null && action.equals("modify")) {
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	/* u = new User(); */
	u.setUsername(username);
	u.setPhone(phone);
	u.setAddr(addr);
	u.update();
	
	response.sendRedirect("selfservice.jsp");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet"  type="text/css"  href="css/semantic.css">
  <script src="scripts/jquery-3.2.1.min.js"></script>
  <script src="scripts/semantic.js" type="text/javascript"></script>
  <script src="scripts/mj.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify</title>
</head>
<body>
  <div class="ui center aligned vertical segment">
    <h1>Modify your account</h1>
  </div>
    
    <div class="ui container vertical segment">
      <form class="ui form segment" action="usermodify.jsp" method="post">
      <input type="hidden" name="action" value="modify"/>
      	<div class="field">
          <label>Username</label>
          <input placeholder="Username" name="username" id="username" type="text" value="<%= u.getUsername() %>">
        </div>
        
        <!-- 
        <div class="field">
          <label>Password</label>
          <input name="password" type="password" id="pwd">
        </div>
        
        <div class="field">
          <label>Password Again</label>
          <input name="password1" type="password" id="pwd1">
        </div>
         -->
        
        <div class="field">
          <label>Phone</label>
          <input type="text" name="phone" value="<%= u.getPhone() %>">
        </div>
        
        <div class="field">
          <label>Address</label>
          <textarea rows="12" cols="80" name="addr" id='addr'><%= u.getAddr() %></textarea>
        </div>
        
        <button type="submit" name="button" class="ui inverted blue button" onclick="login()">Submit</button>
        <!-- <div class="ui primary submit button" onclick="login()">Submit</div> -->
        <!-- <div class="ui primary submit button" type="submit">Submit</div> -->
        <div class="ui reset button">Reset</div>
        <div class="ui error message"></div>
          
        </div>
        
      </form>
      
    </div>

</body>
</html>