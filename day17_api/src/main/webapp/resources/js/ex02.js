'use strict';

function convert(ob) {
	console.log(ob)
	
	const item = document.createElement('div')
	item.className = 'item'
	item.innerHTML += `<div class="title">${ob.TITLE}</div>`
	item.innerHTML += `<div class="subtitle">${ob.SUBTITLE}</div>`
	item.innerHTML += `<div class="day">${ob.USAGE_DAY_WEEK_AND_TIME}</div>`
	item.innerHTML += `<div class="gugun">${ob.GUGUN_NM}</div>`
	item.innerHTML += `<img src="img">${ob.MAIN_IMG_THUMB}</img>`
	item.innerHTML += `<div class="place">${ob.PLACE}</div>`
	item.innerHTML += `<details class="content"><summary>상세정보</summary>${ob.ITEMCNTNTS}</details>`
	item.innerHTML += `<div class="url">자세한 정보는 <a href="${ob.HOMEPAGE_URL}" target="_blank"> 에서 확인하세요</div>`
	return item
}


function loadHandler(event) {
	console.log(event)
	let url = 'http://apis.data.go.kr/6260000/FoodService/getFoodKr'
	const param = {
			serviceKey: 'QrpgyTfX9s6ZXTxs%2FH7VjmGOqy1pEuaGVY1UNmv4wkvZuqUZcEQbPH3BnZLfsR1LXU8bp9xRdo%2F8DRDjjqSMoQ%3D%3D',
			pageNo: 1,
			numofRows: 1000,
			resultType: 'json'
	}
	url += '?'
	for(let key in param) {
		url += key + '=' + param[key] + '&'
	}
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		let arr = json.getFoodKr.item	// 요청한 전체 목록을 가져와서 (149개)
		
		// 만약 change 이벤트에 의해 호출되었고, 이벤트 대상(select)의 값이 ''이 아니라면
		if(event.type == 'change' && event.target.value != '') {
			// 구군 이름이 일치하는 정보만 추려내서(필터링) 저장한다
			arr = arr.filter(dto => dto.GUGUN_NM == event.target.value)
			// arr.forEach()	: 배열의 각 요소에 대하여 반복작업을 수행할 때 
			// arr.map()		: 배열의 각 요소의 형태를 변경(추가/삭제/새로운 객체)하여 새로 저장할 때
			// arr.filter()		: 배열의 각 요소에 대해 특정 조건에 맞는 요소만 포함할 때
			// arr.sort()		: 배열의 각 요소를 특정 기준으로 정렬할 때
		}
		else {
			arr = arr.slice(0, 10)	// 0부터 10이전까지 배열 슬라이싱
		}
		
		arr = arr.map(dto => {
			delete dto.LAT
			delete dto.LNG
			delete dto.ADDR2
//			delete dto.SUBTITLE
			return dto
		})
		const wrap = document.createElement('div')
		wrap.className = 'wrap'
		arr.forEach(ob => wrap.appendChild(convert(ob)))
		root.appendChild(wrap)
	})
}