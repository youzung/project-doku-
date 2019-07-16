<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
</head>
<body>
<form action="/doku/secessionmain" method="post">
	<h3>개인 정보 보호를 위해 비밀번호를 한번 더 입력해주세요.</h3>
	<input type="hidden" id="pwd" name="pwd" value="${sessionScope.pwd}">
	<input type="password" id="pwdchk" name="pwdchk"><br>
	<input id="submit" type="submit" value="확인"><br>
	<div id="pwdError"></div><br>
	</form>
<script>
$(document).ready(function(){
	$("#pwdchk").blur(function(){
		var pwd = $("#pwd").val();
		var pwdchk = $("#pwdchk").val();
		if(pwd != pwdchk){
			$('#pwdError').text("비밀번호가 일치하지 않습니다").css("color","red");
			$("#submit").attr("disabled", true);
		}else{
			$('#pwdError').text("비밀번호가 일치합니다").css("color","green");
			$("#submit").attr("disabled", false);
		}
	});
})
</script>
</body>
</html>