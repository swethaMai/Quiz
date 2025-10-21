<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
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

        .profile-container {
            width: 320px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .profile-container h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #333;
        }

        .profile-container label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #555;
        }

        .profile-container input[type="text"],
        .profile-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            background-color: #fafafa;
        }

        .profile-container input[type="submit"] {
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

        .profile-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2>Update Profile</h2>
        <form action="UpdateProfile" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="<%= username %>" readonly>

            <label for="password">New Password</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
