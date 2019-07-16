<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원 가입이 완료되었습니다.</h3><br><br>
<button onclick="page(1)">메인으로</button>
<button onclick="page(2)">로그인</button>
<script>
function page(cv){
	if(cv==1){
		location.href="/doku/mainpage";
	}else if(cv==2){
		location.href="/doku/loginmain";
	}
}
</script>
</body>
</html>