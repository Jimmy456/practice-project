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

<script>
	function deleteHandler(event) {
		const flag = confirm('정말 삭제하시겠습니까')
		if(flag == false) {
			return
		}
		const item = event.target.parentNode.parentNode
		const idx = item.getAttribute('idx')
		const url = '${cpath}/board/' + idx
		const opt = {
			method: 'DELETE'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				alert('삭제 성공')
				location.reload(false)
			}
		})
	}

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
				div.innerText = new Date(dto[key]).toISOString.split('T')[0]
				item.appendChild(div)
				break;
			case 'content':
				div.classList.add(key)
				const pre = document.createElement('pre')
				pre.innerText = dto[key]
				div.appendChild(pre)
				item.appendChild(div)
				break;
			default:
				div.classList.add(key)
				div.innerText = dto[key]
				item.appendChild(div)
			}
		}
		item.appendChild(item.querySelector('.content'))
		const menu = document.createElement('div')
		menu.classList.add('menu')
		const btn1 = document.createElement('button')
		btn1.innerText = '수정'
		const btn2 = document.createElement('button')
		btn2.innerText = '삭제'
		btn2.addEventListener('click', deleteHandler)
		menu.appendChild(btn1)
		menu.appendChild(btn2)
		item.appendChild(menu)
		return item
	}

	function selectAll() {
		const wrap = document.querySelector('.wrap')
		const offset = wrap.getAttribute('offset')
		const url = '${cpath}/board?offset=' + offset
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			json.forEach(dto => wrap.appendChild(convert(dto)))
		})
		wrap.setAttribute('offset', +offset + 10)
	}
	
	function scrollHandler(event) {
		let target = window.document.documentElement
		if(target.scrollTop + target.clientHeight == target.scrollHeight){
			selectAll()
		}
	}
	
	function writeHandler(event) {
		event.preventDefault()
		
		const ob = {}
		const formData = new FormData(event.target)
		for(key of formData.keys()) {
			ob[key] = formData.get(key)
		}
		
		const url = '${cpath}/board'
		const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type' : 'application/json; charset=utf-8'
				}
		}
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				alert('작성성공')
				location.reload(true)
			}
		})
		
	}
</script>

<h1>board2 (ajax)</h1>
<hr>

<div class="write">
	<form>
		<input type="text" name="iaddr" value="${pageContext.request.remoteAddr }">
		<p><input type="text" name="title" placeholder="제목"></p>
		<p><input type="text" name="writer" placeholder="작성자"></p>
		<p><textarea name="content" placeholder="내용을 작성하세요"></textarea></p>
		<p><input type="text" value="등록"></p>
	</form>
</div>

<div class="wrap" offset="0"></div>

<script>
	const wrap = document.querySelector('.wrap')
	const writeForm = document.forms[0]
	
	window.addEventListener('load', selectAll)
	window.addEventListener('scroll', scollHandler)
	writeForm.addEventListener('submit', writeHanlder)
</script>

</body>
</html>