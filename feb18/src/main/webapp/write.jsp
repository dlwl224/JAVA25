<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션 검사
String mid=(String) session.getAttribute("mid");
if(mid ==null){
	response.sendRedirect("./login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>글쓰기</h1>
	<div>
		<form action="./write" method="post">
			<input type="text" name="title">
			<textarea name="content"></textarea>
			<button type="submit">글쓰기</button>
		</form>
	</div>

</body>
</html>