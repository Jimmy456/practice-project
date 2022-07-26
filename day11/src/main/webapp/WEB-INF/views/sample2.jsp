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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

<button id="btn1">DB 버전 확인</button>
<div id="result1"></div>

<script>
	function handler() {	// XHR 방식을 간결화한 라이브러리, 비교적 가독성이 좋으나 퍼포먼스가 떨어질 수 있다
		$.ajax({
			type: 'GET',
			url: '${cpath}/test2',
			success: function(resp) {
				$('#result1').text(resp)
				// document.querySelector('#result1').innerText = resp
			},
			error: function(){
				alert('통신 실패')
			}
		})
	}
	btn1.addEventListener('click', handler)
</script>

</body>
</html>