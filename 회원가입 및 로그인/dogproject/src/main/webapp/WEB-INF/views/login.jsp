<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
</head>
<body>
<form id="loginForm" method="POST" action="/my/login">
	<input type="text" id="id" name="id" placeholder="아이디" required><br>
	<input type="password" id="pwd" name="pwd" placeholder="비밀번호" required><br>
	<div id="loginError"></div>
	<button id="submit" type="button">로그인</button>
	</form>
	
<script>
	$(document).ready(function(){
		$("#submit").click(function(){
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			var x = false;
			if(id==""){
				$("#loginError").text("아이디를 입력하세요.").css("color", "red");		
				return;
			}else if(pwd==""){
				$("#loginError").text("비밀번호를 입력하세요.").css("color", "red");		
				return;
			}
			$.ajax({
				url : '/my/login?id='+id+'&pwd='+pwd,
				type : 'post',
				success : function(data){
					if(data==false){
							$("#loginError").text("아이디와 비밀번호가 일치하지 않습니다.").css("color", "red");	
					}else{
						alert("로그인 성공");
						window.location.href = '/my/mainpage';
					}
				}
			});
		});
	});
</script>
</body>
</html>