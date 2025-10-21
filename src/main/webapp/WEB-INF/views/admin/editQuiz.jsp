<%@ page import="com.test.model.Quiz" %>
<%
    Quiz quiz = (Quiz) request.getAttribute("quiz");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Quiz</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .edit-container {
            width: 320px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .edit-container h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #333;
        }

        .edit-container label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #555;
        }

        .edit-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            background-color: #fafafa;
        }

        .edit-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .edit-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h2>Edit Quiz</h2>
        <form action="UpdateQuiz" method="post">
            <input type="hidden" name="id" value="<%= quiz.getId() %>">

            <label for="title">Title</label>
            <input type="text" id="title" name="title" value="<%= quiz.getQuizName() %>" required>

            <label for="category">Category</label>
            <input type="text" id="category" name="category" value="<%= quiz.getCategory() %>" required>

            <input type="submit" value="Update Quiz">
        </form>
    </div>
</body>
</html>
