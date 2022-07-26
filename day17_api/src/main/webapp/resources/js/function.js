'use strict';

function convert(ob) {
	console.log(ob)
	
	const item = document.createElement('div')
	item.className = 'item'
	item.innerHTML = `<div class="title">${ob.TITLE}</div>`
	item.innerHTML = `<div class="subtitle">${ob.subtitle}</div>`
	item.innerHTML = `<div class="day">${ob.USAGE_DAY_WEEK_AND_TIME}</div>`
	item.innerHTML = `<div class="gugun">${ob.GUGUN_NM}</div>`
	item.innerHTML = `<div class="img">${ob.MAIN_IMG_THUMB}</div>`
	item.innerHTML = `<div class="place">${ob.PLACE}</div>`
	item.innerHTML = `<details class="content"><summary>상세정보</summary>${ob.ITEMCNTNTS}</details>`
	item.innerHTML = `<div class="url">자세한 정보는 <a href="${ob.HOMEPAGE_URL}" target="_blank"> 에서 확인하세요</div>`
	return item
}


function loadHandler() {
	let url = 'https://apis.data.go.kr/6260000/fe/stivalService/getFestivalKr'
	const param = {
			serviceKey: 'QrpgyTfX9s6ZXTxs%2FH7VjmGOqy1pEuaGVY1UNmv4wkvZuqUZcEQbPH3BnZLfsR1LXU8bp9xRdo%2F8DRDjjqSMoQ%3D%3D',
			pageNo: 1,
			numofRows: 10,
			resultType: 'json',
	}
	
	url += '?'
	for(let key in param) {
		console.log(key)
		url += key + '=' + param[key] + '&'
	}
	
	const root = document.getElementById('root')

	fetch('https://apis.data.go.kr/6260000/FestivalService/getFestivalKr?serviceKey=QrpgyTfX9s6ZXTxs%2FH7VjmGOqy1pEuaGVY1UNmv4wkvZuqUZcEQbPH3BnZLfsR1LXU8bp9xRdo%2F8DRDjjqSMoQ%3D%3D&pageNo=1&numOfRows=10&resultType=json')
	.then(resp => resp.json())
	.then(json => {
		const arr = json.getFestivalKr.item
		arr.forEach(element => {
			delete element.LAT;	// 위도 및 경도 정보 제거
			delete element.LNG;
			delete element.ADDR2;
		})
//			const element = arr[0]
//			root.appendChild(convert(ob))
		const wrap = document.createElement('div')
		wrap.className = 'wrap'
		arr.forEach(element => wrap.appendChild(convert(element)))
		root.appendChild(wrap)
	})
}