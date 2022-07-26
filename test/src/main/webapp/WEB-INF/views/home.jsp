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
	nav > ul {
            display: flex;
            list-style: none;
            justify-content: space-around;
            align-items: center;
            background-color: lightskyblue;
            font-weight: bold;
            font-size: 20px;
            height: 75px;
        }
    nav > ul > li {
            cursor: pointer;
        }
        div#root {
            border: 3px solid black;
            padding: 10px;
        }
        div#root > div {
            height: 300px;
          	display: none;
        }
        div#root > div.selected {
            display: block;
            overflow-x: hidden; /* x축(가로) 스크롤바 숨김 (범위를 벗어나면 보이지 않음) */
            overflow-y: auto;   /* y축(세로) 스크롤바는 내용이 넘치면 나타남 */
        }
        nav > ul > li.selected {
            background-color: white;
        }
        div#root > div > div.item {
            margin: 10px;
            padding: 10px;
            border: 1px solid #dadada;
            cursor: pointer;
        }
        div#root > div.select > div.item:hover {
            background-color: #f5f6f7;
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
	.content {
/* 		position: absolute; */
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

	function deleteHandler(event){ 
	    const flag = confirm('정말 삭제하시겠습니까')
	    if(flag == false) {
	       return
	    }
	    const item = event.target.parentNode.parentNode
	    const idx = item.getAttribute('idx')
	    const url = '${cpath}/todo/' + idx
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

	function closeModal() {
		document.getElementById('modal').classList.add('hidden')
	}

	
	async function openModal(event) {
		const idx = event.target.parentNode.getAttribute('idx')
		const url = '${cpath}/todo/' + idx
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
			const content = document.querySelector('.content')
			content.innerHTML = ''
		})
		document.getElementById('modal').classList.remove('hidden')
	}


	function liMenuHandler(event) {
	    liArray.forEach(li => li.classList.remove('selected')) // li의 배열에 for문을 돌려서 selected라는 클래스를 다 없애고
	    event.target.classList.add('selected')  // 클릭이라는 이벤트가 있을 때만 그 target에 selected를 add한다
	
	    const index = liArray.indexOf(event.target) // 그러면 selected 걸린 target의 index를 찾아서 index 변수에 넣어준다
	
	    divArray.forEach(div => div.classList.remove('selected')) // div의 배열에 for문을 돌려서 selected라는 클래스를 다 없애고
	    divArray[index].classList.add('selected') // 내가 클릭한 index(위에서 넣어준 index 변수)랑 똑같은 순번의 div를 찾아서 selected를 add해주겠다
	}
	
	function convert(dto) {
		const item = document.createElement('div')
		item.classList.add('item')
		item.setAttribute('idx', dto.idx)
		
		for(key in dto) {
			const div = document.createElement('div')
			switch(key){
			case 'idx':
// 			case 'content':
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
		menu.classList.add('menu')
		const btn = document.createElement('button')
		btn.innerText = '삭제'
		btn.addEventListener('click', deleteHandler)
		menu.appendChild(btn)
		item.appendChild(menu)
		return item
	}
	
	
	function selectHandler(event) {
		const select = document.querySelector('div.select')
		select.innerHTML = ''
		const url = '${cpath}/todo'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			json.forEach(dto => select.appendChild(convert(dto)))
		})
	}
	
	
	function insertHandler(event) {
        event.preventDefault()                                      
    
        const ob = {}                                              
        const formData = new FormData(event.target)                 
        for(key of formData.keys()) {                               
            ob[key] = formData.get(key)                             
            }
       
        console.log(ob)
    
        const url = '${cpath}/todo'
        const opt = {
            method: 'POST',
            body: JSON.stringify(ob),                              
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
                
            }
        }
        fetch(url, opt)
        .then(resp => resp.text())
        .then(text => {
            if(text == 1){                                       
                 alert('추가 성공')                
                event.target.reset()                                 

                const e = document.createEvent('HTMLEvents')         
                e.initEvent('click')                                             
                                                                                                              
                const selectLi = document.querySelector('nav li')    
                selectLi.dispatchEvent(e)                            
              
            }
        })
    }
	

</script>

<header>
	<h1><a href="${cpath }">To do List</a></h1>
</header>

<nav>
	<ul>
		<li class="select selected">List</li>
		<li class="insert">Insert</li>
	</ul>
	<div id="modal" class="hidden">
		<div class="content"></div>
		<div class="overlay"></div>
	</div>
</nav>
<hr>

<div id="root">
	<div class="select selected">
	
	</div>
	<div class="insert">
		<form id="insertForm">
			<p><input type="text" name="title" placeholder="제목" required></p>
			<p><textarea name="content" placeholder="내용을 입력하세요"></textarea></p>
			<p><input type="submit" value="등록"></p>
		</form>
	</div>
</div>

<script>
	const liArray = Array.from(document.querySelectorAll('nav > ul > li'))
	const divArray = Array.from(document.querySelectorAll('div#root > div'))
	const insertForm = document.getElementById('insertForm')
	const overlay = document.querySelector('.overlay')
	const content = document.querySelector('.content')
	
	liArray.forEach(li => li.addEventListener('click', liMenuHandler))
	liArray[0].addEventListener('click', selectHandler)
	window.addEventListener('load', selectHandler)
	insertForm.addEventListener('submit', insertHandler)
	overlay.addEventListener('click', closeModal)
	content.addEventListener('click', closeModal)
</script>

</body>
</html>