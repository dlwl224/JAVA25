<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="d-flex justify-content-center mt-5">
		<div class="p-3 m-5 rounded shadow" 
				style="text-align: center; width: 250px">
			<img class="w-100" alt="이미지가 없을 때 출력할 글" src="./img/login.png">
			<form action="./login" method="post">
				<input type="text" class="w-100 pt-1 mt-1" name="id" required="required">	
				<input type="password" class="w-100 pt-1 mt-1" name="pw" required="required">
				<button type="reset" class="btn btn-primary mt-1">clear</button>	
				<button type="submit" class="btn btn-primary mt-1">login</button>
			</form>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>