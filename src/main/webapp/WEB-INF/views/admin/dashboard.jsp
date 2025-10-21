<%@ page import="java.util.*, com.test.model.Quiz" %>
<%
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
    int totalQuizzes = (Integer) request.getAttribute("totalQuizzes");
    int totalUsers = (Integer) request.getAttribute("totalUsers");
    int totalQuestions = (Integer) request.getAttribute("totalQuestions");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 40px 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .summary {
            max-width: 700px;
            margin: auto;
            margin-bottom: 40px;
        }

        .summary table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        .summary th, .summary td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        .summary th {
            background-color: #f8f8f8;
            font-weight: 500;
            color: #555;
        }

        .quiz-table {
            max-width: 1000px;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        .quiz-table th, .quiz-table td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        .quiz-table th {
            background-color: #f8f8f8;
            font-weight: 500;
            color: #555;
        }

        .quiz-table tr:hover {
            background-color: #f1f1f1;
        }

        .button {
            padding: 6px 12px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            margin: 0 4px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .button.delete {
            background-color: #dc3545;
        }

        .button.delete:hover {
            background-color: #b02a37;
        }

        @media (max-width: 768px) {
            .summary table, .quiz-table {
                font-size: 14px;
            }

            .button {
                padding: 5px 10px;
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
    <h2>Quiz Dashboard</h2>

    <div class="summary">
        <table>
            <tr>
                <th>Total Quizzes</th>
                <th>Total Users</th>
                <th>Total Questions</th>
            </tr>
            <tr>
                <td><%= totalQuizzes %></td>
                <td><%= totalUsers %></td>
                <td><%= totalQuestions %></td>
            </tr>
        </table>
    </div>

    <table class="quiz-table">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Category</th>
            <th>Actions</th>
        </tr>
        <%
            if (quizzes != null && !quizzes.isEmpty()) {
                for (Quiz quiz : quizzes) {
        %>
        <tr>
            <td><%= quiz.getId() %></td>
            <td><%= quiz.getQuizName() %></td>
            <td><%= quiz.getCategory() %></td>
            <td>
                <a class="button" href="EditQuizForm?id=<%= quiz.getId() %>">Edit</a>
                <a class="button delete" href="DeleteQuiz?id=<%= quiz.getId() %>" onclick="return confirm('Are you sure you want to delete this quiz?')">Delete</a>
                <a class="button" href="Leaderboard?quizId=<%= quiz.getId() %>">Leaderboard</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No quizzes available.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
