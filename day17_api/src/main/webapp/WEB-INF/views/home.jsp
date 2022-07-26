<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>day17 - API</h1>
<hr>

<ul>
	<li><a href="${cpath }/ex01">ex01 - 부산 축제 정보</a></li>
	<li><a href="${cpath }/ex02">ex02 - 부산 맛집 정보</a></li>
</ul>

</body>
</html>