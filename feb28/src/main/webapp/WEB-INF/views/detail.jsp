<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" herf="css/menu.css">
<style type="text/css">
.detail-div{
	width:90%;
	heght:500px;
	margin:0 auto;
	background-color:#c0c0c0;
	border-radius:10px;
	margin-top: 10px;
}
.detail-title{
	width:100%;
	height:50px;
	font-size:xx-large;
	line-height:50px;
}
.detail-info{
	width:100%;
	height:50px;
	background-color:white;
}
.detail-user, .detail-date{
	width:50%;
	float:left;
	line-height:50px;
}
.detail-date{
	text-align:right;
}
</style>
</head>
<body>
<%@ include file="menu.jsp" %>

<div class="detail-div">
	<div class="detail-title">
		${detail.board_title }
	</div>
	<div class="detail-info">
		<div class="detail-user">
			${detail.user_id }/${detail.user_name }<br>
		</div>
		<div class="detail-date">
			${detail.board_date }
		</div>
	</div>
</div>
<br>
${detail.board_no }<br>
<br>

${detail.board_content }<br>

${detail.board_like }<br>
${detail.user_no }<br>


</body>
</html>