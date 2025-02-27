<%@page import="list.dto.TodoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession userSession = request.getSession();
    if (userSession.getAttribute("user") == null) {
        response.sendRedirect("./login.jsp");
        return;
    }

    TodoDTO todo = (TodoDTO) request.getAttribute("todo");
    if (todo == null) {
%>
        <script>
            alert("할 일 정보를 불러오지 못했습니다.");
            location.href = "<%= request.getContextPath() %>/todomain.jsp";
        </script>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할 일 수정</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 900px;
        margin: 40px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        font-size: 28px;
        color: #333;
        text-align: center;
        margin-bottom: 30px;
    }
    .form-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .form-container label {
        font-size: 16px;
        color: #333;
        margin-bottom: 8px;
        display: block;
    }
    .input-group {
        flex: 1;
        margin-right: 20px;
        margin-bottom: 15px;
    }
    .input-group:last-child {
        margin-right: 0;
    }
    input[type="text"], input[type="date"], textarea {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    textarea {
        height: 150px;
    }
    button {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    button:hover {
        background-color: #45a049;
    }
    .link {
        display: inline-block;
        margin-top: 15px;
        font-size: 16px;
        color: #007BFF;
        text-decoration: none;
    }
    .link:hover {
        text-decoration: underline;
    }
    hr {
        margin: 20px 0;
        border: 0;
        border-top: 1px solid #ccc;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>할 일 수정</h2>
        <form action="<%= request.getContextPath() %>/todo/update" method="post">
            <input type="hidden" name="todoNo" value="<%= todo.getTodoNo() %>">
            
            <div class="form-container">
                <div class="input-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" value="<%= todo.getTitle() %>" required>
                </div>
                <div class="input-group">
    				 <label for="dueDate">마감일</label>
   					 <input type="datetime-local" id="dueDate" name="dueDate"
        				value="<%= (todo.getDueDate() != null) ? todo.getDueDate().toLocalDateTime().toString().substring(0, 16) : "" %>"
        				required>
				</div>
            </div>
            <hr>
            <div class="input-group">
                <label for="description">내용</label>
                <textarea id="description" name="description" required><%= (todo.getDescription() != null) ? todo.getDescription() : "" %></textarea>
            </div>
            
            <div class="input-group">
                <label for="status">
                    <input type="checkbox" id="status" name="status" value="true" <%= todo.isStatus() ? "checked" : "" %>>
                    완료 여부
                </label>
            </div>

            <div class="form-container">
                <button type="submit">수정하기</button>
                <a class="link" href="<%= request.getContextPath() %>/todomain.jsp">목록 보기</a>
            </div>
        </form>
    </div>
</body>
</html>

