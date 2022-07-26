'use strict';	// 엄격한 모드
// var, let, const 가 없으면 변수 선언으로 처리하지 않는다

function test() {
	alert('test')
}
// dto.idx		// 객체의 내부 요소에 접근
// dto['idx']	// array, map의 idx번째에 접근한다

function convert(dto) {
	const item = document.createElement('div')
	item.className = 'item'
	item.setAttribute('idx', dto.idx)
	
	for(let key in dto) {
		switch(key) {
		case 'idx':
		case 'ipaddr':
			continue;
		case 'writeDate':
			const d = new Date(dto[key]).toISOString().split('T')[0]
			item.innerHTML += `<div class="${key}">${d}</div>`
			break;
		default:
			item.innerHTML += `<div class="${key}">${dto[key]}</div>`
		}
	}
	item.appendChild(item.querySelector('.content'))
	
	const menu = document.createElement('div')
	menu.classList.add('menu')
	const btn1 = document.createElement('button')
	btn1.innerText = '수정'
	const btn2 = document.createElement('button')
	btn2.innerText = '삭제'
	menu.appendChild(btn1)
	menu.appendChild(btn2)
	item.appendChild(menu)
	
	return item
}

async function selectList(event) {
	const root = document.getElementById('root')
	const offset = root.getAttribute('offset')
	const url = cpath + '/board/' + offset
	await fetch(url)
	.then(resp => resp.json())
	.then(json => {
//		const dto = json[0]
//		root.appendChild(convert(dto))
		console.log(json)
		json = json.map(dto => {
			return {
				'idx': dto.idx,
				'title': dto.title,
				'writer': dto.writer,
				'content': dto.content,
				'writeDate': dto.writeDate,
			}
		})
		console.log(json)
		json.forEach(dto => root.appendChild(convert(dto)))
	})
	root.setAttribute('offset', +offset + 10)
}

function scrollHandler(event) {
	let target = document.documentElement
//	console.log(target.scrollTop)
//	console.log(target.scrollHeight)
//	console.log(target.clientTop)
//	console.log(target.clientHeight)
//	console.log('===========================')
	const flag = target.scrollTop + target.clientHeight >= target.scrollHeight
	if(flag) {
		selectList()
	}
}

function scrollToTop(event) {
	document.documentElement.scrollTop = 0
}

function scrollToBottom(event) {
	document.documentElement.scrollTop = document.documentElement.scrollHeight
}

async function loadHandler(event) {
	const paramOffset = +location.search.split('=')[1]
	const attrOffset = +document.getElementById('root').getAttribute('offset')
	
	console.log(isNaN(paramOffset))
	if(isNaN(paramOffset) || paramOffset == 10) {
		selectList()
	}
	else {
		console.log(paramOffset, attrOffset)
		for(let i = 0; i < paramOffset; i += 10) {
			await selectList()
			console.log(i)
		}
	}
//	const e = document.createEvent('HTMLEvents')
//	e.initEvent('click')
//	const toBottom = document.querySelector('div.toBottom')
//	toBottom.dispatchEvent(e)
	document.documentElement.scrollTop = (document.documentElement.scrollHeight - 2000)
	
}

function reloadHandler(event) {
	if(event.key == 'F5') {
		event.preventDefault()
		const offset = document.getElementById('root').getAttribute('offset')
		let url = location.href
		
		const flag1 = location.search.includes('offset') == false
		const flag2 = offset != 10
		if(flag1 && flag2) {
			url += '?offset=' + offset
		}
		else if(flag1 == false) {
			url = url.split('?')[0]
			url += '?offset=' + offset 
		}
		alert(url)
		location.href = url
	}
}

