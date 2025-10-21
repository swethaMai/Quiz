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

        .container {
            width: 320px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            text-align: center;
        }

        .container h2 {
            margin-bottom: 24px;
            font-weight: 500;
            color: #333;
        }

        .nav-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-list li {
            margin-bottom: 16px;
        }

        .nav-list a {
            display: block;
            padding: 12px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
            transition: background-color 0.3s ease;
        }

        .nav-list a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, Admin</h2>
        <ul class="nav-list">
            <li><a href="Register">Register</a></li>
            <li><a href="UserQuiz">Explore</a></li>
            <li><a href="Logout">Logout</a></li>
        </ul>
    </div>
</body>
</html>
