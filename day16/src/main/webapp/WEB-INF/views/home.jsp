<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day16</title>
<style>

</style>
<script>
	const cpath = '${cpath}'

	// 함수 선언
	function submitHandler(event) {
		event.preventDefault()
		
		const formData = new FormData(event.target)
		const url = cpath + '/member'
		const opt = {
			method: 'POST',
			body: formData
		}
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			alert(text == 1 ? '회원 가입 성공' : '회원 가입 실패')
		})
	}
</script>
</head>
<body>

<h1>day16</h1>
<hr>

<ul>
	<li><a href="${cpath }/ex01">ex01 - ajax 파일 업로드</a></li>
</ul>

<form>
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="Password"></p>
	<p><input type="text" name="username" placeholder="Name"></p>
	<p><input type="date" name="birth"></p>
	<p><input type="file" name="profileImg"></p>
	<p><input type="submit"></p>
</form>

<script>
	const form = document.forms[0]
	form.addEventListener('submit', submitHandler)
</script>




</body>
</html>











