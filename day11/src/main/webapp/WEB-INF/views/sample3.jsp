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

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>">

<button id="btn1">DB 버전 확인</button>
<div id="result1"></div>

<script>
	function handler() {	// ajax용 라이브러리, nodeJS 및 react 계열에서 자주 사용한다
		const url = '${cpath}/test2'
		axios.get(url)
			.then(resp => {
				console.log(resp)
				document.getElementById('result1').innerText = resp.data
			})
			.catch(e => alert('예외 발생'))
			.finally(function() {/*alert('마무리')*/})
	}
	btn1.addEventListener('click', handler)
</script>

</body>
</html>