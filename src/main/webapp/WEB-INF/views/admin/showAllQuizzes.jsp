<%@ page import="java.util.*, com.test.model.Quiz, com.test.model.Question" %>
<%
    Map<Quiz, List<Question>> quizMap = (Map<Quiz, List<Question>>) request.getAttribute("quizMap");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Quizzes</title>
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

        .quiz-card {
            background-color: #fff;
            margin: 20px auto;
            padding: 24px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            max-width: 800px;
        }

        .quiz-card h3 {
            margin-bottom: 16px;
            color: #007BFF;
            font-size: 20px;
        }

        .question {
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #eee;
        }

        .question strong {
            display: block;
            margin-bottom: 8px;
            color: #444;
        }

        .options {
            margin-left: 20px;
            font-size: 14px;
            color: #555;
        }

        .answer {
            margin-top: 6px;
            font-weight: bold;
            color: #28a745;
        }

        hr {
            border: none;
            border-top: 1px solid #ddd;
            margin: 40px 0;
        }

        @media (max-width: 768px) {
            .quiz-card {
                padding: 16px;
            }

            .quiz-card h3 {
                font-size: 18px;
            }

            .options {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
    <h2>All Quizzes and Their Questions</h2>
    <%
        for (Map.Entry<Quiz, List<Question>> entry : quizMap.entrySet()) {
            Quiz quiz = entry.getKey();
            List<Question> questions = entry.getValue();
    %>
        <div class="quiz-card">
            <h3><%= quiz.getQuizName() %> (<%= quiz.getCategory() %>)</h3>
            <% for (Question q : questions) { %>
                <div class="question">
                    <strong><%= q.getQuestion() %></strong>
                    <div class="options">
                        A. <%= q.getOptionA() %><br>
                        B. <%= q.getOptionB() %><br>
                        C. <%= q.getOptionC() %><br>
                        D. <%= q.getOptionD() %>
                    </div>
                    <div class="answer">Answer: <%= q.getAnswer() %></div>
                </div>
            <% } %>
        </div>
    <% } %>
</body>
</html>

