<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="m-3 p-3 bg-light">
		<!-- 데이터베이스에서 값 가져오기 -->
		<!--  번호, 이름, 전화번호, 주소 [수정][삭제] -->
		<div>
			<div style="display: table;  width:100%; border: 1px solid gray;">
				<div style="display: table=row">
					<div style="display: table-cell">번호</div>
					<div style="display: table-cell">이름</div>
					<div style="display: table-cell">전화번호</div>
					<div style="display: table-cell">주소</div>
				</div>
				<div style="display: table-row">
					<div style="display: table-cell">10</div>
					<div style="display: table-cell">홍길동</div>
					<div style="display: table-cell">010-5555-2685</div>
					<div style="display: table-cell">서울 구로구 구로동</div>
					
		</div>
	</div>
	<hr>
	<div class="m-3 p-3 bg-light">
		<!-- 주소록 저장하기 -->	
		<!-- 이름, 전화번호, 주소 -->
		<div class="row">
			<form action="./address" method="post">
				<div class="m-3 row">
				<label for="name1" class="col-sm-2 col-from-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name1" name="name">
					</div>
				</div>
	
				<div class="m-3 row">
				<label for="tel2" class="col-sm-2 col-from-label">전화번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="tel2" name="tel">
					</div>
				</div>
		
				<div class="m-3 row">
				<label for="addr3" class="col-sm-2 col-from-label">주소</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="addr3" name="addr">
					</div>
				</div>
				<div class="m-3 row text-end">
					<button class="btn btn-primary">저장</button>
				</div>
			</form>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
