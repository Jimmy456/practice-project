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
	li:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<h1>day11</h1>
<hr>
<ul>
	<li><a href="${cpath }/sample1">XMLHttpRequest</a></li>
	<li><a href="${cpath }/sample2">jQuery</a></li>
	<li><a href="${cpath }/sample3">Axios</a></li>
</ul>

<fieldset>
	<legend>DB version</legend>
	<button id="btn1">DB 버전 확인하기</button>
	<div id="result1"></div>
</fieldset>

<fieldset>
	<legend>member4의 목록</legend>
	<button id="btn2">member 불러오기</button>
	<div id="result2"></div>
</fieldset>

<script>
	// 3) 특정 li태그 (member의 userid)를 클릭했을 때
	// 해당 member의 상세 정보를 보여주기
	const useridList = document.querySelectorAll('ul.userid > li')
	
	const handler3 = function(event) {
		const userid = event.target.innerText
		const url = '${cpath}/member/' + userid
		
		if(event.target.children.length == 0) {
			fetch(url)
			.then(resp => resp.json())
			.then(json => {
				const ul = document.createElement('ul')
				for(key in json) {
					const li = document.createElement('li')
					switch (key) {
					case 'userpw':
						li.innerText = key + ' : ********'
						break

					case 'birth':
						const birth = new Date(json[key]).toSOString().split('T')[0]
						li.innerText = key + ' : ' + birth
						break
						
					default:
						li.innerText = key + ' : ' + json[key]
					}
					ul.appendChild(li)				
				}
				event.target.appendChild(ul)
			})
		}
		else {
			const old = event.target.querySelector('ul')
			event.target.removeChild(old)
		}
	}

	// 2) member의 userid만 불러오기
	const btn2 = document.getElementById('btn2')
	const result2 = document.getElementById("result2")
	
	const handler2 = function() {
		const url = '${cpath}/member'
		if(result2.children.length == 0){
			fetch(url)					// XMLHttpRequest 요청을 보낸다
			.then(resp => resp.json())	// 응답을 받아서 json형식으로 변환한다
			.then(json => {				// json형식의 객체를 매개변수로 받아서 다음 내용을 처리한다
				console.log(json)	// 자바의 List<String>이 JS의 Array타입으로 변환되어 안심됨
				const ul = document.createElement('ul')
				json.forEach(userid => {
					const li = document.createElement('li')
					li.innerText = userid
					li.addEventListener('click', handler3)
					ul.appendChild(li)
				})
				result2.appendChild(ul)
			})
		
		const useridList = document.querySelectorAll('ul.userid > li')
		useridList.forEach(userid => userid.onclick = handler3)		
	}
		else {
			result2.innerHTML = ''
		}
}
	btn2.addEventListener('click', handler2)

	
	// 1) DB 버전 불러오기
	const btn1 = document.getElementById('btn1')
	const result1 = document.getElementById('result1')
	
	btn1.addEventListener('click', function() {
		const url = '${cpath}/test2'
		const opt = {
			method: 'GET'
		}
		
		fetch(url, opt)							// 주소와 옵션으로 요청을 보낸다
		.then(resp => resp.text())				// 받은 응답을 text형식으로 처리한다
		.then(text => result1.innerText = text)	// text의 값을 result1의 innerText로 대입
	})
</script>

</body>
</html>