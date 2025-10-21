<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
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

        .admin-container {
            width: 320px;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .admin-container h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #333;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin-bottom: 12px;
        }

        a.button {
            display: block;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
            transition: background-color 0.3s ease;
        }

        a.button:hover {
            background-color: #0056b3;
        }

        @media (max-width: 400px) {
            .admin-container {
                width: 90%;
                padding: 20px;
            }

            a.button {
                font-size: 14px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <h2>Welcome, Admin</h2>
        <ul>
            <li><a class="button" href="Dashboard">Dashboard</a></li>
            <li><a class="button" href="UpdateProfile">Update Profile</a></li>
            <li><a class="button" href="AddQuestion">Add Questions</a></li>
            <li><a class="button" href="ShowQuestions">Show Questions</a></li>
            <li><a class="button" href="ShowAllQuizzes">Show All Quizzes</a></li>
            <li><a class="button" href="CreateQuizForm">Create Quiz</a></li>
            <li><a class="button" href="Logout">Logout</a></li>
        </ul>
    </div>
</body>
</html>
