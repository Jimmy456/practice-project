'use strict'

function convert(dto) {
	const item = document.createElement('div')
	item.className = 'item'
	item.setAttribute('idx', dto.idx)
	
	for(let key in dto){
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
		json = json.map(dto => {
			return {
				'idx': dto.idx,
				'title': dto.title,
				'writer': dto.writer,
				'content': dto.content,
				'writeDate': dto.writeDate,
			}
		})
		json.forEach(dto => root.appendChild(convert(dto)))
	})
	root.setAttribute('offset', +offset +10) // const가 정수가 아니기 때문에 +를 붙여주면 정수형태로 바뀜
}

function scrollHandler(event) {
	let target = document.documentElement
	const flag = target.scrollTop + target.clientHeight >= target.scrollHeight
}

function scrollTopHandler(event) {
	document.documentElement.scrollTop = 0
}

function scrollBottomHandler(event) {
	document.documentElement.scrollTop = document.documentElement.scrollHeight
}


async function loadHandler(event) {
	const paramOffset = +location.search.split('=')[1]
	const attrOffset = +document.getElementById('root')
	
	console.log(isNaN(paramOffset))
	if(isNaN(paramOffset) || paramOffset == 10) {
		selectList()
	}
	else {
		console.log(paramOffset, attrOffset)
		for(let i = 0; i < paramOffset; i += 10) {
			await selectList()
		}
	}
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