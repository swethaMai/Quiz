<%@ page import="java.util.*, com.test.model.Quiz" %>
<%
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
%>
<html>
<head>
    <title>Quiz Dashboard</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
        a.button { padding: 6px 12px; background: #007BFF; color: white; text-decoration: none; border-radius: 4px; }
        a.button.delete { background: #dc3545; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Quiz Dashboard</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Category</th>
            <th>Actions</th>
        </tr>
        <%
            for (Quiz quiz : quizzes) {
        %>
        <tr>
            <td><%= quiz.getId() %></td>
            <td><%= quiz.getQuizName() %></td>
            <td><%= quiz.getCategory() %></td>
            <td>
                <a class="button" href="EditQuiz?id=<%= quiz.getId() %>">Edit</a>
                <a class="button delete" href="DeleteQuiz?id=<%= quiz.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
