<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<style>
	#signupForm { margin:auto; width:200px; }
</style>
</head>
<body>
	<section id="signupForm">
		<form method="POST" action="/doku/signup" >
			<img alt="로고빡"></img>
			<h1>회원가입</h1>
			아이디<br>
			<input id="userId" type="text" name="id" required><br>
			<div id="idError"></div><br>
			이메일<br>
			<input type="text" name="email" required><br><br>
			비밀번호<br>
			<input id="pwd" type="password" name="pwd" required><br><br>
			비밀번호 재확인<br>
			<input id="pwdchk" type="password" name="pwdchk" required><br>
			<div id="pwdError"></div>
			<br>
			이름<br>
			<input type="text" name="name" required><br><br>
			닉네임<br>
			<input id="nickname" type="text" name="nickname" required><br>
			<div id="nicknameError"></div><br>
			주소<br>
			<input type="text" name="address" required><br><br>
			개이름<br>
			<input type="text" name="pet" required><br><br><br>
			<input id="submit" type="submit" value="가입하기">
		</form>
	</section>
	<p>아이디 및 닉네임은 가입 후 변경하실 수 없으니 이점 유의해주시기 바랍니다.</p>
	<script>
		$(document).ready(function(){
			$("#userId").blur(function(){
				var id = $("#userId").val();
				$.ajax({
					url : '/doku/validateForm?id=' + id,
					type : 'get',
					success : function(data){
						if (data == true){ // id 중복됨
							$('#idError').text("이미 사용중인 아이디").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else if (id == ""){
							$('#nicknameError').text("필수 입력란입니다.").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else {
							$('#idError').text("사용 가능한 아이디").css("color", "blue");
							if ($("#nicknameError").text() == "사용 가능한 닉네임"
								&& $('#pwdError').text() == "일치합니다"){
								$("#submit").attr("disabled", false);
							}
						}
					},
					error : function(){ console.log("실패"); }
				});
			});
			$("#nickname").blur(function(){
				var nickname = $("#nickname").val();
				$.ajax({
					url : '/doku/validateForm1?nickname=' + nickname,
					type : 'get',
					success : function(data){
						if (data == true){ // id 중복됨
							$('#nicknameError').text("이미 사용중인 닉네임").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else if (nickname == ""){
							$('#nicknameError').text("필수 입력란입니다.").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else {
							$('#nicknameError').text("사용 가능한 닉네임").css("color", "blue");
							if ($("#idError").text() == "사용 가능한 아이디"
									&& $('#pwdError').text() == "일치합니다"){
								$("#submit").attr("disabled", false);
							}
						}
					},
					error : function(){ console.log("실패"); }
				});
			});
			$("#pwdchk").blur(function(){
				var pwd = $("#pwd").val();
				var pwdchk = $("#pwdchk").val();
				if(pwd != pwdchk){
					$('#pwdError').text("일치하지 않습니다").css("color","red");
					$("#submit").attr("disabled", true);
				}else{
					$('#pwdError').text("일치합니다").css("color","green");
					if ($("#idError").text() == "사용 가능한 아이디"
						&& $("#nicknameError").text() == "사용 가능한 닉네임"){
					$("#submit").attr("disabled", false);
				}
				}
			});
		})
	</script>
</body>
</html>