<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
       
        body { background-color: #f4f6f9; display: flex; justify-content: center; align-items: center;
            	height: 100vh; margin: 0;}
        .login-container {width: 320px; padding: 30px; background: white;
            	border-radius: 15px; text-align: center; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */}
        .login-container img { width: 80px; margin-bottom: 15px;}
        .form-control {border-radius: 10px; margin-bottom: 10px;}
        .btn-custom {width: 100%; padding: 10px; border-radius: 10px; font-weight: bold; transition: 0.3s; }
        .btn-clear {background-color: #e74c3c;color: white; margin-top: 10px;}
        .btn-clear:hover { background-color: #c0392b; }
        .btn-login {background-color: #007BFF; color: white; margin-top: 10px;}
        .btn-login:hover { background-color: #0056b3; }
        .d-flex {justify-content: space-between; }
    	.d-flex button {width: 48%;}
</style>
</head>
<body>
	<div class="login-container">
			 <img src="./img/login.png" alt="로그인 이미지">
			 
			 <form action="./login" method="post">
				<input type="text" class="w-100 pt-1 mt-1" name="userId" placeholder="아이디" required>	
				<input type="password" class="w-100 pt-1 mt-1" name="userPw" placeholder="비밀번호" required>
				
				<div class="d-flex justify-content-between">
                	<button type="reset" class="btn btn-custom btn-clear">Clear</button>    
                	<button type="submit" class="btn btn-custom btn-login">Login</button>
            	</div>
			</form>
		</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>