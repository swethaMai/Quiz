<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Add Question</title></head>
<body>
<h2>Add New Question</h2>
<form action="AddQuestion" method="post">
    Question: <input type="text" name="question" required><br>
    Option A: <input type="text" name="optionA" required><br>
    Option B: <input type="text" name="optionB" required><br>
    Option C: <input type="text" name="optionC" required><br>
    Option D: <input type="text" name="optionD" required><br>
    Correct Answer: 
    <select name="answer">
        <option value="A">A</option>
        <option value="B">B</option>
        <option value="C">C</option>
        <option value="D">D</option>
    </select><br>
    <input type="submit" value="Add Question">
</form>
</body>
</html>
