<%@ page import="java.util.List" %>
<%@ page import="com.test.model.Question" %>
<%
    List<Question> questions = (List<Question>) request.getAttribute("questions");
    String message = (String) request.getAttribute("message");
%>
<html>
<head><title>Create Quiz</title></head>
<body>
    <h2>Create a New Quiz</h2>

    <% if (message != null) { %>
        <p><strong><%= message %></strong></p>
    <% } %>

    <form action="CreateQuiz" method="post">
        <label>Title:</label><br>
        <input type="text" name="title" required><br><br>

        <label>Category:</label><br>
        <select name="category" required>
            <option value="Core Java">Core Java</option>
            <option value="MySQL">MySQL</option>
            <option value="JDBC">JDBC</option>
            <option value="JSP">JSP</option>
            <option value="Servlets">Servlets</option>
        </select><br><br>

        <label>Select Questions:</label><br>
        <% if (questions != null && !questions.isEmpty()) {
            for (Question q : questions) {
        %>
            <input type="checkbox" name="questionIds" value="<%= q.getId() %>">
            <%= q.getQuestion() %><br>
        <%  }
           } else { %>
            <p>No questions available.</p>
        <% } %>

        <br><input type="submit" value="Create Quiz">
    </form>
</body>
</html>
