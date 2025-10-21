<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.model.Question" %>
<%
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Questions</title>
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
            max-width: 1000px;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 14px;
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

        a.button {
            padding: 6px 12px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        a.button:hover {
            background-color: #0056b3;
        }

        a.button.delete {
            background-color: #dc3545;
        }

        a.button.delete:hover {
            background-color: #b02a37;
        }

        @media (max-width: 768px) {
            table, th, td {
                font-size: 13px;
            }

            a.button {
                padding: 5px 10px;
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
    <h2>All Questions</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Question</th>
            <th>Option A</th>
            <th>Option B</th>
            <th>Option C</th>
            <th>Option D</th>
            <th>Answer</th>
            <th>Operations</th>
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
            <td>
                <a class="button" href="EditQuestionForm?id=<%= q.getId() %>">Edit</a>
                <a class="button delete" href="DeleteQuestion?id=<%= q.getId() %>" onclick="return confirm('Delete this question?')">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>


