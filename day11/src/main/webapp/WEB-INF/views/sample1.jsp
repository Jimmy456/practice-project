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

<button id="btn1">DB 버전 확인</button>
<div id="result1"></div>

<script>
	function handler() {	// 가장 초창기에 사용되던 ajax 방식. 별도의 라이브러리는 필요 없다
		
		const xhr = new XMLHttpRequest()		// 요청 객체 생성
		
		xhr.onreadystatechange = function() {	// 상태가 변경될 때 실행할 함수
			console.log(this)
			if(this.status == 200 && this.readyState == this.DONE) {	// 결과가 200이고
				const result1 = document.getElementById('result1')		// 상태가 완료이면
				result1.innerText = xhr.responseText			// 응답 텍스트를 출력할 것이다
			}
		}

		xhr.open('GET', '${cpath}/test2')	// 주소와 메서드를 결정하고
		
		xhr.send()							// 요청을 보낸다 (보내면 readystatechange에 걸린 함수가 실행됨)
	}
	btn1.addEventListener('click', handler)
</script>

</body>
</html>