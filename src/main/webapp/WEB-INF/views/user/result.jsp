<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.test.model.UserScore" %>
<%
    int score = (Integer) request.getAttribute("score");
    List<UserScore> leaderboard = (List<UserScore>) request.getAttribute("leaderboard");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .result-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 600px;
        }

        .result-container h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .score {
            font-size: 18px;
            text-align: center;
            margin-bottom: 30px;
            color: #007BFF;
        }

        h3 {
            text-align: center;
            margin-bottom: 16px;
            color: #444;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f8f8;
            font-weight: 500;
            color: #555;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        @media (max-width: 600px) {
            .result-container {
                padding: 20px;
            }

            th, td {
                font-size: 14px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="result-container">
        <h2>Quiz Completed</h2>
        <div class="score">Your Score: <strong><%= score %></strong></div>

        <h3>Leaderboard</h3>
        <table>
            <tr>
                <th>Rank</th>
                <th>Username</th>
                <th>Score</th>
            </tr>
            <%
                int rank = 1;
                for (UserScore us : leaderboard) {
            %>
            <tr>
                <td><%= rank++ %></td>
                <td><%= us.getUserName() %></td>
                <td><%= us.getScore() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
