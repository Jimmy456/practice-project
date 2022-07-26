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

<h1>day15</h1>
<hr>

<div id="root" offset="0"></div>

<div id="remocon">
	<button class="toTop">▲</button>
	<button class="toBottom">▼</button>
</div>

<script>
	const toTop = document.querySelector('toTop')
	const toBottom = document.querySelector('toBottom')
	
	window.addEventListener('load', loadHandler)
	window.addEventListener('scroll', scrollHandler)
	toTop.addEventListener('click', TopscrollHandler)
	toBottom.addEventListener('click', BottomscrollHandler)
	
	window.addEventListener('keydown', reloadHandler)
	
</script>


</body>
</html>