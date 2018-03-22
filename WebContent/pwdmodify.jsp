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
	String password = request.getParameter("password");
	
	u.setPassword(password);
	System.out.println(password);
	u.changePwd();
	
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
    <h1>Modify your password</h1>
  </div>
    
    <div class="ui container vertical segment">
      <form class="ui form segment" action="pwdmodify.jsp" method="post">
      <input type="hidden" name="action" value="modify"/>
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
          <label>Password</label>
          <input type="password" name="password" value="" id="pwd">
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