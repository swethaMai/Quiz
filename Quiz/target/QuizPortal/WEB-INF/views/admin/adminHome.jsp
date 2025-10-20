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
        <li><a href="addQuestions.jsp">Add Questions</a></li>
        <li><a href="showQuestions.jsp">Show Questions</a></li>
        <li><a href="showQuiz.jsp">Show All Quiz</a></li>
        <li><a href="createQuiz.jsp">Create Quiz</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul> 
    <jsp:include page="dashboard.jsp" />
</body>
</html>