<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
	<ul>
		<li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="updateProfile.jsp">Update Profile</a></li>
        <li><a href="AddQuestion">Add Questions</a></li>
        <li><a href="ShowQuestions">Show Questions</a></li>
        <li><a href="ShowAllQuizzes">Show All Quiz</a></li>
        <li><a href="CreateQuizForm">Create Quiz</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul> 
    <jsp:include page="dashboard.jsp" />
    <a href="AdminHome.jsp">Back to Admin Home</a>
</body>
</html>