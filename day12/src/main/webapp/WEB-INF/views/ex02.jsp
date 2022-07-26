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

<h1>ex02</h1>
<hr>

<div id="root"></div>

<button>클릭</button>

<script>
	const root = document.getElementById('root')
	const btn = document.querySelector('button')
	
	function handler(event) {
		const url = '${cpath}/imgList'
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			// 이미지 파일의 이름을 전달받아서
			// root 안에 flex wrap의 형식으로 보여주기
			for(let i = 0; i < json.length; i++){
				const div = document.createElement('div')
				div.className = 'item'
				
				const img = document.createElement('img')
				img.src = '${cpath}/resources/img/' + json[i]
				img.width = '300'
				div.appendChild(img)
				root.appendChild(div)
			}
		})
	}
	
	btn.addEventListener('click', handler)
</script>

</body>
</html>