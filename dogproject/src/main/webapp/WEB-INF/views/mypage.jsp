<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	아이디 : ${sessionScope.id} <br>
	이메일 : ${sessionScope.email} <br>
	이름 : ${sessionScope.name} <br>
	닉네임 : ${sessionScope.nickname} <br>
	주소 : ${sessionScope.address} <br>
	견종 : ${sessionScope.pet} <br>
</div>

<button onclick="updateinfo()">회원 정보 수정</button>
<button onclick="secession()">회원 탈퇴</button>

<% 
	if(request.getAttribute("msg") != null) {
%>
<script>
	alert('${msg}');
</script>
<%
	}
%>

<script>
	function updateinfo(){
		location.href="/doku/mypagepwd";
	}
	function secession(){
		location.href="/doku/secessionpwd";
	}
</script>
</body>
</html>