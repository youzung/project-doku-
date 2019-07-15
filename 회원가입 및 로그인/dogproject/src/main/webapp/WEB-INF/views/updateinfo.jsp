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
	<div id="update" align="center">
	<form method="post" action="/my/update">
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<p>아이디 : ${sessionScope.id}</p><br>
		변경 비밀번호 : <input type="password" name="pwd" id="pwd" value="${sessionScope.pwd}"><br>
		비밀번호 확인 : <input type="password" name="pwdchk" id="pwdchk" value="${sessionScope.pwdchk}"><br>
		<div id="pwdError"></div><br>
		이메일 : <input type="text" name = "email" id="email" value="${sessionScope.email}"><br>
		주소 : <input type="text" name = "address" id="address" value="${sessionScope.address}"><br>
		견종 : <input type="text" name = "pet" id="pet" value="${sessionScope.pet}"><br>		
		<input id="submit" type="submit" value="수정">
	</form>
	<button onclick="secession()">탈퇴</button>
	</div>
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
	$("#pwd").blur(function(){
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
<script>
function secession(){
	location.href="/my/secessionmain";
}
</script>
</body>
</html>