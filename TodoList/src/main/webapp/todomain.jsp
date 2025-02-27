<%@page import="list.dto.TodoDTO"%>
<%@page import="java.util.List"%>
<%@page import="list.dao.TodoDAO"%>
<%@page import="list.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // 로그인 확인
    UserDTO user = (UserDTO) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("./login.jsp");
        return;
    }

    // DB에서 사용자 할 일 목록 가져오기
    TodoDAO dao = new TodoDAO();
    List<TodoDTO> todos = dao.getTodoByUser(user.getUserNo()); 
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>TODO LIST</title>
 	<style>
        body {font-family: Arial, sans-serif; text-align: center; background-color: #f4f6f9;}
        .container {display: flex; flex-direction: column; align-items: center; width: 80%; margin: auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
        .buttons {text-align: right; margin-top: 10px; }
        .btn { padding: 8px 12px; border: 1px solid #007BFF; border-radius: 5px; 
            	text-decoration: none; color: #007BFF; font-weight: bold; 
            	display: inline-block; margin: 5px;transition: background-color 0.3s, color 0.3s; }
        .btn:hover { background-color: #007BFF; color: white; }
        .btn-delete, .btn-edit { padding: 5px 10px; border: 1px solid #ddd; background-color: transparent; 
           							 font-size: 14px; color: #007BFF; transition: background-color 0.3s, color 0.3s;}
        .btn-delete:hover, .btn-edit:hover { background-color: #007BFF; color: white; }
    	.btn-create {color: black; border: 1px solid #ddd; }
        .btn-create:hover {background-color: #f4f4f4;color: #007BFF;}
    	input[type="checkbox"] {transform: scale(1.5); margin: 0; }
    	.checked td, .checked td * { text-decoration: line-through; color: #999;}
    	
    </style>
    <script>
        function updateStatus(todoNo, isChecked) {
            var status = isChecked ? 1 : 0; // 체크되면 1(완료), 해제되면 0(미완료)
         	// 체크박스를 클릭할 때 해당 행에 취소선 추가/제거
            var row = document.getElementById("todo-" +todoNo);
         	if (isChecked) {
                row.classList.add("checked");
            } else {
                row.classList.remove("checked");
            }
            fetch("<%= request.getContextPath() %>/todo/updateStatus", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "todoNo=" + todoNo + "&status=" + status
            }).then(response => {
                if (response.ok) {
                    console.log("✅ 상태 업데이트 성공");
                } else {
                    console.log("❌ 상태 업데이트 실패");
                }
            });
        }
    </script>
</head>

<body>
    <h1><%= user.getUserName() %>의 TODO LIST</h1>

    <div class="container">

        <!-- 버튼 영역 -->
        <div class="buttons">
            <a href="<%= request.getContextPath() %>/write.jsp" class="btn btn-create">TODO 작성하기</a>
            <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-create">메인 페이지</a>
        </div>


        <!-- 할 일 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>✅</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>마감일</th>
                    <th>수정 / 삭제</th>
                </tr>
            </thead>
            <tbody>
                <% if (todos.isEmpty()) { %>
                    <tr>
                        <td colspan="6" style="text-align:center;">할 일이 없습니다. 새로운 할 일을 작성해 보세요!</td>
                    </tr>
                <% } else { 
                    for (TodoDTO todo : todos) { %>
                        <tr id="todo-<%= todo.getTodoNo() %>" class="<%= todo.isStatus() ? "checked" : "" %>">
    						<td style="text-align: center;">
        						<input type="checkbox" onclick="updateStatus(<%= todo.getTodoNo() %>, this.checked)" 
            						<%= todo.isStatus() ? "checked" : "" %> > 
                            </td>
                            <td><strong><%= todo.getTitle() %></strong></td>
                            <td><%= todo.getDescription() %></td> <!-- ✅ 내용 표시 -->
                            <td><%= todo.getDueDate() %></td>
                           
                            <td>
                                <!-- 수정 버튼 -->
                                <a href="<%= request.getContextPath() %>/todo/edit?todoNo=<%= todo.getTodoNo() %>" class="btn-edit">수정</a>
                                
                                <!-- 삭제 버튼 -->
                                <form action="<%= request.getContextPath() %>/todo/delete" method="post" style="display:inline;">
                                    <input type="hidden" name="todoNo" value="<%= todo.getTodoNo() %>">
                                    <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="btn-delete">삭제</button>
                                </form>
                            </td>
                        </tr>
                <% } } %>
            </tbody>
        </table>
    </div>

</body>

</html>
