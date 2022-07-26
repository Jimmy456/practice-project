<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.item {
		width: 500px;
		margin: 20px auto;
		padding: 10px;
		border: 1px solid #dadada;
	}
</style>
</head>
<body>
<script>
	// 함수 정의
	function convert(dto) {
		const item = document.createElement('div')
		item.classList.add('item')
		item.setAttribute('idx', dto.idx)
		for(key in dto) {
			const div = document.createElement('div')
			switch(key) {
			case 'idx':
			case 'viewCount':
			case 'category':
			case 'ipaddr':
			case 'uploadFile':
			case 'deleted':
				continue;
			case 'writeDate':
				div.classList.add(key)
				div.innerText = new Date(dto[key]).toISOString().split('T')[0]
				item.appendChild(div)
				break;
			default:
				div.classList.add(key)
				div.innerText = dto[key]
				item.appendChild(div)
			}
		}
		const menu = document.createElement('div')
		const btn1 = document.createElement('button')
		const btn2 = document.createElement('button')
		btn1.innerText = '수정'
		btn2.innerText = '삭제'
		menu.appendChild(btn1)
		menu.appendChild(btn2)
		item.appendChild(menu)
		return item
	}
	
	function selectAll() {
		const wrap = document.querySelector('.wrap')
		
		const url = '${cpath}/board'
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			// json 객체를 받아서, HTMLElement로 변환하는 과정이 필요하다 convert(dto)
// 			const dto = json[0]
// 			wrap.appendChild(convert(dto))
			json.forEach(dto => wrap.appendChild(convert(dto)))
		})
	}
</script>

<h1>board2 (ajax)</h1>
<hr>

<div class="write"></div>

<div class="wrap"></div>

<script>
	window.addEventListener('load', selectAll)
</script>


</body>
</html>