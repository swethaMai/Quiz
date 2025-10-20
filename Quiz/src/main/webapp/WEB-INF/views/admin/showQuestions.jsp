<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.model.Question" %>
<%
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<html>
<head>
    <title>All Questions</title>
</head>
<body>
    <h2>All Questions</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Question</th>
            <th>Option A</th>
            <th>Option B</th>
            <th>Option C</th>
            <th>Option D</th>
            <th>Answer</th>
        </tr>
        <%
            for (Question q : questions) {
        %>
        <tr>
            <td><%= q.getId() %></td>
            <td><%= q.getQuestion() %></td>
            <td><%= q.getOptionA() %></td>
            <td><%= q.getOptionB() %></td>
            <td><%= q.getOptionC() %></td>
            <td><%= q.getOptionD() %></td>
            <td><%= q.getAnswer() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <br>
    <a href="AdminHome">Back to Admin Home</a>
</body>
</html>
