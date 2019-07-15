<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.id != null}">
<h2>${sessionScope.id}(${sessionScope.nickname}) 환영함</h2>
<a href="/my/logout">로그아웃</a> <!--건호형 로그인 화이팅!!!!  -->
<a href="/my/petmember">멤버확인</a>
<a href="/my/mypage">마이페이지</a>
</c:if>
<c:if test="${sessionScope.id == null}">
	<a href="/my/loginmain">로그인</a>
	<a href="/my/agree">회원가입</a>
</c:if>
</body>
</html>