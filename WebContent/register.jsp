<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="top.sadboy.shopping.*" %>    
    
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
if (action != null && action.equals("register")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	User u = new User();
	u.setUsername(username);
	u.setPassword(password);
	u.setPhone(phone);
	u.setAddr(addr);
	u.setRdate(new Timestamp(System.currentTimeMillis()));
	u.save();
	response.sendRedirect("login.jsp");
}

%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/semantic.css">
  <script src="scripts/jquery-3.2.1.min.js"></script>
  <script src="scripts/semantic.js"></script>
  <script src="scripts/mj.js"></script>
  <title>Sign Up</title>
</head>
<body>


  <div class="ui center aligned vertical segment">
    <h1>Create your account</h1>
    </div>

    <div class="ui container vertical segment">
      <form class="ui form segment" method="post" action="register.jsp">
      <input type="hidden" name="action" value="register"/>
        <div class="field">
          <label>Username</label>
          <input placeholder="Username" name="username" id="username" type="text">
        </div>

        <div class="field">
          <label>Password</label>
          <input name="password" type="password" id="pwd">
        </div>

        <div class="field">
          <label>Password Again</label>
          <input name="password1" type="password" id="pwd1">
        </div>

        <div class="field">
          <label>Phone</label>
          <input type="text" name="phone">
        </div>

        <div class="field">
          <label>Address</label>
          <textarea rows="12" cols="80" name="addr" id='addr'></textarea>
        </div>
		
		<button type="submit" class="ui teal submit button" onclick="login()">Submit</button>
        <!-- <div class="ui primary submit button" onclick="login()">Submit</div> -->
        <div class="ui reset button">Reset</div>
        <div class="ui error message">

        </div>

      </form>

    </div>

</body>
</html>