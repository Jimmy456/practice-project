<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#root {
		width: 1800px;
		display: flex;
		flex-flow: wrap;
	}
	.item {
		width: 800px;
		margin: 10px;
		padding:10px;
		border: 1px solid black;
	}
	.item > .runningTime {
		float: right;
	}
	.item > .title {
		font-size: 24px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.item > .story {
		width: 500px;
		height: 200px;
		overflow: auto;
		padding: 10px;
		border: 1px solid grey;
	}
	.item > .image {
		width: 240px;
		height: 240px;
		background-size: auto 100%;
		background-position: center;
		background-repeat: no-repeat;
		position: absolute;
		bottom: 10px;
		right: 10px;
	}
</style>
</head>
<body>

<h1>ex03</h1>
<hr>

<div id="root"></div>
<button>책</button>

<script>
	const button = document.createElementById('button')
	
	function handler(event) {
		const url = '${cpath}/movie'
		fetch(url).then(resp => resp.json())
		.then(arr => {
			const root = document.createElementById('root')

			// 배열이니까 for문으로 i번째 요소에 접근한다
			for(let i = 0; i < arr.length; i++){
				const ob = arr[i]
				const item = document.createElement('div')
				item.className = 'item'
				
				// 객체에 대해서 key로 value에 접근한다
				for(key in arr[i]) {
					const div = document.createElement('div')
					div.className = key
					div.innerText = arr[i][key]
					
					switch(key) {
					case 'idx':
					case 'isBoxOffice':
					case 'isDeleted':
					case 'isCurrentScreen':
						continue
					case 'image':
						div.innerText = ''
						div.style.backgroundImage = 'url("${cpath}/resources/movie/' + arr[i][key] + ")'"
						break
					case 'runningTime':
						div.innerText += '분'
						break
					case 'director':
						div.innerText = '감독 : ' + div.innerText
					}
					
					item.appendChild(div)
				}
				root.appendChild(item)
			}
		})
	}
	btn.addEventListener('click', handler)
</script>

</body>
</html>