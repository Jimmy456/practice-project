<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>interceptor test</title>
</head>
<body>

<h1><a href="${cpath }">day09</a></h1>
<div align="right">
	${login }
</div>
<hr>
<h3>로그인이 필요한 메뉴는 (*)로 표시합니다</h3>
<nav>
	<ul>
		<li>
			member
			<ul>
				<li><a href="${cpath }/join">join</a></li>
				<li><a href="${cpath }/login">login</a></li>
				<li><a href="${cpath }/logout">logout</a></li>
				<li><a href="${cpath }/mypage">mypage</a></li>
			</ul>
		</li>
		<li>
			board
			<ul>
				<li><a href="${cpath }/board/list">list</a></li>
				<li><a href="${cpath }/board/view">view</a></li>
				<li><a href="${cpath }/board/write">write (*)</a></li>
				<li><a href="${cpath }/board/modify">modify (*)</a></li>
				<li><a href="${cpath }/board/delete">delete (*)</a></li>
			</ul>
		</li>
	</ul>
</nav>

</body>
</html>