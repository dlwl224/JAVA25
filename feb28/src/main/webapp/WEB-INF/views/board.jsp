<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드</title>
<link rel="stylesheet" href="./css/menu.css">
</head>
<body>
   <jsp:include page="menu.jsp"/>
   <h1>board</h1>
   서버에서 준 이름 : ${name1 } <!-- EL -->
   <hr>
   <!-- JSTL로 찍겠습니다 -->
   for(BoardDTO dto : list){ syso(dto); } fn length 사용하기 ${fn:length(list) }개 글이 있습니다.
   <!-- 
   > gt
   < lt
   >= ge
   <= le
   == eq
   != ne
   empty
   not empty   
    -->
   
   <c:choose>
      <c:when test="${fn:length(list) gt 0 }">
      <table border="1">
   <tr>
      <td>번호</td>
      <td>제목</td>
      <td>글쓴이</td>
      <td>날짜</td>
      <td>좋아요</td>   
   <c:forEach items="${list }" var="dto">
   <tr>
      <td>${dto.board_no }</td>
      <td>${dto.board_title }</td>
      <td>${dto.user_name }</td>
      <td>${dto.board_date }</td>
      <td>${dto.board_like }</td>
   </tr>
   </c:forEach>
   </table>
      </c:when>
      <c:otherwise>
         데이터가 없습니다
      </c:otherwise>
   </c:choose>
   
   
   <button onclick="location.href='./write'">글쓰기</button>
   
   <hr>
   ${list }
   
   <c:forEach begin="1" end="9" var="row">
   <c:forEach begin="1" end="10" var="in">
      ${row } X ${in } = ${row * in }<br>
   </c:forEach>
   <br>
   </c:forEach>
</body>
</html>