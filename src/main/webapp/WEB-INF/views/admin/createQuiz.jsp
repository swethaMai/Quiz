<%@ page import="java.util.List" %>
<%@ page import="com.test.model.Question" %>
<%
    List<Question> questions = (List<Question>) request.getAttribute("questions");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Quiz</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #333;
        }

        .message {
            text-align: center;
            color: #28a745;
            font-weight: 500;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #555;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            background-color: #fafafa;
        }

        .questions-list {
            margin-bottom: 20px;
        }

        .questions-list label {
            display: block;
            margin-bottom: 10px;
            font-size: 14px;
            color: #444;
        }

        input[type="checkbox"] {
            margin-right: 8px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Create a New Quiz</h2>

        <% if (message != null) { %>
            <div class="message"><%= message %></div>
        <% } %>

        <form action="CreateQuiz" method="post">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" required>

            <label for="category">Category</label>
            <select id="category" name="category" required>
                <option value="Core Java">Core Java</option>
                <option value="MySQL">MySQL</option>
                <option value="JDBC">JDBC</option>
                <option value="JSP">JSP</option>
                <option value="Servlets">Servlets</option>
            </select>

            <label>Select Questions</label>
            <div class="questions-list">
                <% if (questions != null && !questions.isEmpty()) {
                    for (Question q : questions) {
                %>
                    <label>
                        <input type="checkbox" name="questionIds" value="<%= q.getId() %>">
                        <%= q.getQuestion() %>
                    </label>
                <%  }
                   } else { %>
                    <p>No questions available.</p>
                <% } %>
            </div>

            <input type="submit" value="Create Quiz">
        </form>
    </div>
</body>
</html>
