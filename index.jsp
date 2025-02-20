
<%@page import="feb13web.web.Board"%>
<%@page import="java.util.List"%>
<%@page import="feb13web.web.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script type="text/javascript">
//스크립트 주석
function go(){
	location.herf="./board.jsp";
}
</script>
</head>
<!-- 게시판 형식 table div -->


<body>
	<h1 class="text-primary">인덱스 입니다.</h1>
	<!-- 2025-02-14 -->
	<button onclick="go()" class="btn btn-warning">메인으로</button>
	<div class="m-3">
		<button onclick="location.href='./login.jsp'" class="btn">LOGIN</button>
	<pre>
	html 뼈대
	css 살 피부
	js 기능
	</pre>
	
	<!-- 주석 -->
<%
// 여기는 자바
BoardDAO dao = new BoardDAO();
List<Board> list = dao.list();
%>

<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>좋아요</th>
	</tr>
	<% for(Board board : list){ %>
	<tr>
		<td><%=board.getBoard_no() %></td>
		<td>
			<a href="./detail.jsp?bno=<%=board.getBoard_no() %>">
				<%=board.getBoard_title() %>
			</a>			
		</td>
		<td><%=board.getUser_name() %></td>
		<td><%=board.getBoard_date() %></td>
		<td><%=board.getBoard_like() %></td>
	</tr>
	<% } %>
</table>

	<button onclick="location.href='./write.jsp'">글쓰기</button>

</body>
</html>
