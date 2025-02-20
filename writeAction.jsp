<%@page import="feb13web.web.BoardDAO"%>
<%@page import="feb13web.web.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// write.jsp에서 작성한 데이터가 이곳으로 옵니다
String title = request.getParameter("title");
String content = request.getParameter("content");
String no = request.getParameter("no");

//보드DTO객체 만들기
Board board = new Board();
board.setBoard_title(title);
board.setBoard_content(content);
board.setUser_no(Integer.parseInt(no));

BoardDAO dao = new BoardDAO();
dao.write(board);

%>

제목 : <%=title %><br>
내용 : <%=content %><br>
번호 : <%=no %><br>

<a href="./index.jsp">인덱스로</a>

</body>
</html>
