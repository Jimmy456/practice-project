<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day16 - gallery</title>
<style>
	#root {
		display: flex;
		flex-flow: wrap;
		padding: 10px;
		width: 850px;
		margin: 10px auto; 
	}
	#upload {
		width: 850px;
		padding: 10px;
		margin: 10px auto; 
		border: 3px solid black;
	}
	#upload > form {
		display: flex;
		justify-content: space-around;
	}
	.item {
		box-sizing: border-box;
		width: 250px;
		margin: 10px;
	}
	.item > .img {
		border: 1px solid red;
		height: 150px;
		background-position: center center;
		background-size: auto 100%;
		background-repeat: no-repeat;
		cursor: pointer;
	}
	.item > .memo {
		text-align: center;
		padding: 10px;
		font-size: 1.1em;
	}
	
	.overlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		z-index: 1;
	}
	img {
		box-shadow: 20px 20px 10px grey;
	}
	.content {
		position: absolute;
		top: 0;
		left: 0;
		z-index: 2;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.hidden {
		display: none;
	}
</style>
</head>
<body>

<script>

	function closeModal() {
		document.getElementById('modal').classList.add('hidden')
	}

	async function openModal(event) {
		console.log(event.target.parentNode.getAttribute('idx'))
		
		const idx = event.target.parentNode.getAttribute('idx')
		const url = '${cpath}/gallery/' + idx
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
			const content = document.querySelector('.content')
			content.innerHTML = ''
			const img = document.createElement('img')
			img.src = '${cpath}/upload/' + json.img
			img.title = json.memo
			content.appendChild(img)
		})
		document.getElementById('modal').classList.remove('hidden')
	}

	
	function convert(dto) {
		const item = document.createElement('div')
		item.className = 'item'
		item.setAttribute('idx', dto.idx)
		
		const img = document.createElement('div')
		img.className = 'img'
		img.style.backgroundImage = "url('${cpath}/upload/" + dto.img + "')"
		img.addEventListener('click', openModal)
		
		const memo = document.createElement('div')
		memo.className = 'memo'
		memo.innerText = dto.memo
		
		item.appendChild(img)
		item.appendChild(memo)
		
		return item
	}
	
	
	function loadHandler(event) {
		const root = document.getElementById('root')
		const url = '${cpath}/gallery'
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			json.forEach(dto => root.appendChild(convert(dto)))
		})
	}
	
	async function submitHandler(event) {
		event.preventDefault()
		const root = document.getElementById('root')
		const formData = new FormData(event.target)
		const url = '${cpath}/gallery'
		const opt = {
			method: 'POST',
			body: formData
		}
		await fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				alert('업로드 성공')
			}
			event.target.reset()
		})
		root.innerHTML = ''
		loadHandler()
	}
</script>

<h1>day16 - gallery</h1>
<hr>

<div id="upload">
	<form>
		<p><input type="file" name="file" accept="image/*" required></p>
		<p><input type="text" name="memo" placeholder="그림에 대한 간단한 설명" required></p>
		<p><input type="submit">
	</form>
</div>

<div id="root"></div>

<div id="modal" class="hidden">
	<div class="content"></div>
	<div class="overlay"></div>
</div>

<script>
	const form = document.forms[0]
	const overlay = document.querySelector('.overlay')
	const content = document.querySelector('.content')
	
	window.addEventListener('load', loadHandler)
	form.addEventListener('submit', submitHandler)
	overlay.addEventListener('click', closeModal)
	content.addEventListener('click', closeModal)
</script>

</body>
</html>