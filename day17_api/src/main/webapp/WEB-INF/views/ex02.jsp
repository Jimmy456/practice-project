<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/ex02.css"/>
</head>
<body>
<script>const cpath = '${cpath}'</script>
<script src="${cpath }/resources/js/ex02.js"></script>

<h1>ex02 - 부산 맛집 정보</h1>
<hr>

<select id="gugunNm" name="gugunNm">
	<option value="">== 전체 ==</option>
	<option value="남구">남구</option>
	<option value="수영구">수영구</option>
	<option value="해운대구">해운대구</option>
</select>
	
<div id="root"></div>

<script>
	const gugunNm = document.getElementById('gugunNm')

	window.addEventListener('load', loadHandler)
	gugunNm.addEventListener('change', loadHandler)
</script>

</body>
</html>