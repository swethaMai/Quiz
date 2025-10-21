<%@ page import="java.util.*, com.test.model.Quiz" %>
<%
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Quizzes</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 600px;
            margin: auto;
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

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background-color: #fafafa;
            margin-bottom: 12px;
            padding: 16px;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #ddd;
        }

        .quiz-info {
            font-size: 15px;
            color: #555;
        }

        .start-button {
            padding: 8px 14px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .start-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Available Quizzes</h2>
        <ul>
            <% for (Quiz quiz : quizzes) { %>
                <li>
                    <div class="quiz-info">
                        <strong><%= quiz.getQuizName() %></strong><br>
                        Category: <%= quiz.getCategory() %>
                    </div>
                    <a class="start-button" href="AttemptQuiz?quizId=<%= quiz.getId() %>">Start Quiz</a>
                </li>
            <% } %>
        </ul>
    </div>
</body>
</html>
