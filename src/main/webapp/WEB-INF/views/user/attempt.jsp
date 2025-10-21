<%@ page import="java.util.*, com.test.model.Question" %>
<%
    int quizId = (Integer) request.getAttribute("quizId");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 700px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .question-block {
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 1px solid #eee;
        }

        .question-block p {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 12px;
            color: #444;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #555;
        }

        input[type="radio"] {
            margin-right: 8px;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quiz</h2>
        <form action="Validate" method="post">
            <input type="hidden" name="quizId" value="<%= quizId %>">
            <% for (Question q : questions) { %>
                <div class="question-block">
                    <p><%= q.getQuestion() %></p>
                    <label><input type="radio" name="q<%= q.getId() %>" value="A"> <%= q.getOptionA() %></label>
                    <label><input type="radio" name="q<%= q.getId() %>" value="B"> <%= q.getOptionB() %></label>
                    <label><input type="radio" name="q<%= q.getId() %>" value="C"> <%= q.getOptionC() %></label>
                    <label><input type="radio" name="q<%= q.getId() %>" value="D"> <%= q.getOptionD() %></label>
                </div>
            <% } %>
            <input type="submit" value="Submit Answers">
        </form>
    </div>
</body>
</html>
