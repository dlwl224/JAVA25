<%@page import="feb13web.web.Board"%>
<%@page import="feb13web.web.BoardDAO"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//자바 영역
BoardDAO dao = new BoardDAO();
List<Board> list = dao.list();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>보드입니다</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<!-- 서블릿 -- jsp -- 스프링 -->
<!-- 값찍기 : 변수 하나 출력할 때 사용합니다 -->
<%-- <%=list.get(0).getBoard_date() %> --%>
<!-- 
실행순서
1. 자바가 실행
2. 값 출력 위치에 값출력
3. 코드 제거
4. html화
5. 클라이언트에게 전송
6. 클라이언트 브라우저에서 랜더링
7. css, js
8. 끝

 -->

<!-- 게시판 형식 table  div -->

<table class="table table-hover table-striped">
	<tr>
		<th class="w-10">번호</th>
		<th class="w-50">제목</th>
		<th class="w-10">글쓴이</th>
		<th class="w-20">날짜</th>
		<th class="w-10">좋아요</th>
	</tr>
	<% for(int i = 0; i < list.size(); i++){ 
		Board b = list.get(i);
	%>
	<tr>
		<td><%=b.getBoard_no() %></td>
		<td>
		<a herf="./detail.jsp?board_no=<%=b.getBoard_no() %>">
			<%=b.getBoard_title() %>
		</a>
		</td>
		<td><%=b.getUser_name() %></td>
		<td><%=b.getBoard_date() %></td>
		<td><%=b.getBoard_like() %></td>
	</tr>
	<% } %>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
