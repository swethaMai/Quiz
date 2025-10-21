<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Question</title>
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

        .form-container {
            width: 360px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #555;
        }

        .form-container input[type="text"],
        .form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            background-color: #fafafa;
        }

        .form-container input[type="submit"] {
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

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Question</h2>
        <form action="AddQuestion" method="post">
            <label for="question">Question</label>
            <input type="text" id="question" name="question" required>

            <label for="optionA">Option A</label>
            <input type="text" id="optionA" name="optionA" required>

            <label for="optionB">Option B</label>
            <input type="text" id="optionB" name="optionB" required>

            <label for="optionC">Option C</label>
            <input type="text" id="optionC" name="optionC" required>

            <label for="optionD">Option D</label>
            <input type="text" id="optionD" name="optionD" required>

            <label for="answer">Correct Answer</label>
            <select id="answer" name="answer" required>
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
                <option value="D">D</option>
            </select>

            <input type="submit" value="Add Question">
        </form>
    </div>
</body>
</html>
