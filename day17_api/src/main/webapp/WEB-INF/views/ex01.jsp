<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day17</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/style.css"/>
</head>
<body>
<script>
	const cpath = '${cpath}'
</script>
<script src="${cpath }/resources/js/function.js"></script>

<h1>day17 - API</h1>
<hr>

<div id="root"></div>

<script>
	window.addEventListener('load', loadHandler)
</script>

</body>
</html>