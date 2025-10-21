<%@ page import="java.util.*, com.test.model.UserScore" %>
<%
    List<UserScore> leaderboard = (List<UserScore>) request.getAttribute("leaderboard");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leaderboard</title>
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

        table {
            width: 100%;
            max-width: 700px;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #f8f8f8;
            font-weight: 500;
            color: #555;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td[colspan="3"] {
            color: #999;
            font-style: italic;
        }

        @media (max-width: 768px) {
            table, th, td {
                font-size: 14px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h2>Quiz Leaderboard</h2>
    <table>
        <tr>
            <th>Rank</th>
            <th>User</th>
            <th>Score</th>
        </tr>
        <%
            if (leaderboard != null && !leaderboard.isEmpty()) {
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
            } else {
        %>
        <tr>
            <td colspan="3">No participants yet.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
