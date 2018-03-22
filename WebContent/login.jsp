<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="top.sadboy.shopping.*" %>    
    
    
<%
String action = request.getParameter("action");
if (action != null && action.equals("login")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User u = null;
	try {
		u = User.validate(username, password);
	} catch (UserNotFoundException e) {
		out.println("UsernameOrPasswordNotCorrect!");
		return;
	} catch (PasswordNotCorrectException e) {
		out.println("UsernameOrPasswordNotCorrect!");
		return;
	}
	
	session.setAttribute("user", u);
	if (username.equals("admin") & password.equals("zxc123")) {
		session.setAttribute("admin", u);
		response.sendRedirect("admin/index.jsp");
	} else {
		response.sendRedirect("index.jsp");
		/* response.sendRedirect("selfservice.jsp"); */
	}
}
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="css/semantic.css">
  <script src="scripts/jquery-3.2.1.min.js"></script>

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <img src="image/logo.png" class="image">
      <div class="content">
        Log-in to your account
      </div>
    </h2>
    <form class="ui large form" method="post">
      <input type="hidden" name="action" value="login"/>
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="username" placeholder="Username" id="username">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password" id="pwd">
          </div>
        </div>
        <button type="submit" class="ui fluid large teal submit button" onclick="login()">Login</button>
        <div class="ui error message"></div>
      </div>

    </form>
'
    <div class="ui message">
      New to us? <a href="register.jsp">Sign Up</a>
    </div>
  </div>
</div>

</body>

</html>
