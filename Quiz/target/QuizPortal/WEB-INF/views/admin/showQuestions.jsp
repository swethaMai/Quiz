<%@ page import="java.util.*,com.test.dao.QuestionDao,com.test.model.Question" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>All Questions</title></head>
<body>
<h2>All Questions</h2>
<%
    List<Question> list = QuestionDao.getAllQuestions();
    for (Question q : list) {
%>
    <p><b><%= q.getQuestion() %></b><br>
    A: <%= q.getOptionA() %><br>
    B: <%= q.getOptionB() %><br>
    C: <%= q.getOptionC() %><br>
    D: <%= q.getOptionD() %><br>
    Answer: <%= q.getAnswer() %></p>
    <hr>
<% } %>
</body>
</html>
