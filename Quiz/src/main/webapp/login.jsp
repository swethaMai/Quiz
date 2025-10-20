<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<form action="Login" method="post">
	    Username: <input type="text" name="username" placeholder="Enter Username" required><br>
	    Password: <input type="password" name="password" placeholder="Enter Password" required><br>
	    Role:
	    <select name="role">
	        <option value="user">user</option>
	        <option value="admin">admin</option>
	    </select><br>
	    <input type="submit" value="Login">
	    <p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
	</form>
</body>
</html>