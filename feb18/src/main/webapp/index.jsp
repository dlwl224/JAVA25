<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 입니다.</title>
</head>
<body>
	<h1>인덱스 입니다.</h1>
	<c:choose>
		<c:when test="${not empty sessionScope.mid } ">
			${sessionScope.mid }님 반갑습니다.
			<a href="./logout">로그아웃</a>
		</c:when>
		<c:otherwise>
			로그인 해주세요<a href="./login.jsp">로그인</a>
		</c:otherwise>
	</c:choose>
	<hr>
	<a href="./boardjsp">게시판</a>
	<a href="./login.jsp">로그인</a>

</body>
</html>