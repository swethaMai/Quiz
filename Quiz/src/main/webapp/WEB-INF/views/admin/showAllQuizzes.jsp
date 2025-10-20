<%@ page import="java.util.*, com.test.model.Quiz, com.test.model.Question" %>
<%
    Map<Quiz, List<Question>> quizMap = (Map<Quiz, List<Question>>) request.getAttribute("quizMap");
%>
<html>
<head><title>All Quizzes</title></head>
<body>
    <h2>All Quizzes and Their Questions</h2>
    <%
        for (Map.Entry<Quiz, List<Question>> entry : quizMap.entrySet()) {
            Quiz quiz = entry.getKey();
            List<Question> questions = entry.getValue();
    %>
        <h3><%= quiz.getQuizName() %> (<%= quiz.getCategory() %>)</h3>
        <ul>
        <% for (Question q : questions) { %>
            <li><strong><%= q.getQuestion() %></strong><br>
                A. <%= q.getOptionA() %><br>
                B. <%= q.getOptionB() %><br>
                C. <%= q.getOptionC() %><br>
                D. <%= q.getOptionD() %><br>
                Answer: <%= q.getAnswer() %>
            </li><br>
        <% } %>
        </ul>
        <hr>
    <%
        }
    %>
</body>
</html>
