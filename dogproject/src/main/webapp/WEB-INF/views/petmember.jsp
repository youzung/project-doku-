<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.vo.PetMemberVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		ArrayList<PetMemberVO> al = (ArrayList<PetMemberVO>) request.getAttribute("list");
		if (al != null) {
	%>
		<section id="member">
		<table>
			<tr class="head">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr> 
	<%
			for (PetMemberVO data : al) {
	%>
			<tr>
				<td><%= data.getId() %></td>
				<td><%= data.getEmail() %></td>
				<td><%= data.getPwd() %></td>
				<td><%= data.getPwdchk() %></td>
				<td><%= data.getName() %></td>
				<td><%= data.getNickname() %></td>
				<td><%= data.getAddress() %></td>
				<td><%= data.getPet() %></td>
			</tr>
	<%   
			}
	%>
	<%   
		}
	%>
		</table>
	</section>
</body>
</html>