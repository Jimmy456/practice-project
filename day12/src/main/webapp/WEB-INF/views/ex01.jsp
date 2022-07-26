<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>KFC 메뉴만 불러오기</h1>
<hr>

<div id="root"></div>

<script>

	const str = '[{"name": "이지은", "age": 30},{"name": "홍진호", "age": 41}]'
	console.log(typeof(str))
	const ob = JSON.parse(str)	// 문자열을 자바스크립트 객체 형태로 변환한다
	
	console.log(str)
	console.log(ob)
	
	const str2 = JSON.stringify(ob)	// 자바 스크립트 객체를 JSON규격의 문자열로 변환한다
	console.log(str2)

	function kfcmenu() {
		const root = document.getElementById('root')
		
		const url = '${cpath}/kfc'
		fetch(url)
		.then(resp => resp.json())	// return resp.json()
		.then(json => {
			console.log(json)
			const arr = json
			
			for(let i = 0; i < arr.length; i++){
				const dto = arr[i]
				const item = document.createElement('div')
				item.classList.add('item')
				item.innerText = dto.name + ' : ' + dto.price + '원'
				root.appendChild(item)
			}
		})
	}
	
// 	window.onload = kfcmenu						// 이벤트 함수를 하나만 연결할 수 있다
	window.addEventListener('load', kfcmenu)	// 함수를 여러개 추가할 수 있다
	
</script>

</body>
</html>