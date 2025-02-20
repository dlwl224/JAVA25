
<%@page import="feb18.dto.BoardDTO"%>
<%@page import="feb18.dao.BoardDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
BoardDAO dao = new BoardDAO();
List<BoardDTO> list = dao.list();
request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
   <h1>게시판</h1>
   <!-- 
   0. jsp
   1. DTO
   2. DAO
   3. jsp에서 호출해서 사용 -->

   <table border="1">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>날짜</th>
            <th>좋아요</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${list }" var="row">
            <tr>
               <td>${row.board_no }</td>
               <!-- dto에 존재하는 변수명 -->
               <td>${row.board_title }</td>
               <td>${row.user_no }</td>
               <td>${row.board_date }</td>
               <td>${row.board_like }</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
   <!-- EL tag + JSTL -->
   <!-- 세션에서 mid라는 변수로 저장된 값 가져오기 -->
   <%
   String mid = (String) session.getAttribute("mid");
   //String user_no = (String) session.getAttribute("user_no");
   if (mid != null) {
   %>
   ${sessionScope.mid }님 반갑습니다.
   <button onclick="location.href='./write.jsp'">글쓰기</button>

   <%
   }
   %>


</body>
</html>