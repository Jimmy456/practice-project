<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day15 (board2, ajax)</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/style.css">
<script>
	const cpath = '${cpath}'
</script>
<script src="${cpath }/resources/js/function.js"></script>
</head>
<body>

<h1><a href="${cpath }">day15 (board2, ajax)</a></h1>
<hr>

<div id="root" offset="0"></div>

<div id="remocon">
	<div class="toTop">▲</div>
	<div class="toBottom">▼</div>
</div>

<script>
	const toTop = document.querySelector('.toTop')
	const toBottom = document.querySelector('.toBottom')

// 	window.addEventListener('load', selectList)
	window.addEventListener('load', loadHandler)
	window.addEventListener('scroll', scrollHandler)
	toTop.addEventListener('click', scrollToTop)
	toBottom.addEventListener('click', scrollToBottom)
	
// 	window.addEventListener('reload', reloadHandler)
	window.addEventListener('keydown', reloadHandler)
</script>

</body>
</html>












