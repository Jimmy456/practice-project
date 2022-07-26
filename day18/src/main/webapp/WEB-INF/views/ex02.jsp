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
		width: 1000px;
		margin: auto;
	}
	.item {
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-weight: bold;
		margin: 200px 0;
		padding: 0 10px;
		width: 0;
		overflow: hidden;
		trsition-duration: 1.5s;
		position: relative;
	}
	.item > div:first-child {
		position: absolute;
		left: 10px;
	}
	.item > div:last-child {
		position: absolute;
		right: 10px;
	}
	.item:nth-child(2n+1) {
		background-color: lightpink;
	}
	.item:nth-child(2n) {
		background-color: lightskyblue;
	}
</style>
</head>
<body>
<script>
	function loadHandler1() {
		let url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson'
		const param = {
				serviceKey: 'K7G5hCA%2FRqnmALDK%2F7POZXDGSgTgQFRIcOqpF8HUf9rqLn17QSaJ4Q0Ox732h%2BF%2FgxuyB3bXrdEWApNVwrOtWA%3D%3D',
				pageNo: 1,
				numofRows: 10,
				startCreateDt: '20220701',
				endCreateDt: '20220725'
			}
			url += '?'
			for(let key in param) {
				url += key + '=' + param[key] + '&'
			}
			fetch(url)
			.then(resp => resp.text())
			.then(text => console.log(text))
	}
	
	
	function convert(dto) {
		const item = document.createElement('div')
		item.className = 'item'
			const details = document.createElement('details')
			for(let key in dto) {
				if(key == '날짜') {
					const summary = document.createElement('summary')
					summary.innerText = dto[key]
					details.appendChild(summary)
				}
				else {
					const flex = document.createElement('div')
					flex.className = 'flex'
					
					const left = document.createElement('div')
					left.innerText = key	// key를 변경해두었기 때문에 그대로 출력
					
					const right = document.createElement('div')
					right.innerText = dto[key]
					
					flex.appendChild(left)
					flex.appendChild(right)
					details.appendChild(flex)	
				}
			}
			item.appendChild(details)
			return item
	}
	
	
	function resize(item) {
		let num = +item.lastElementChild.innerText
		let cnt = 1
		while(num > 1) {
			num /= 10
			cnt *= 10
		}
		const size = +item.lastElement * (cnt / 5) / cnt
		item.style.width = size / 100 ? size + 'px' : '180px'
	}
	
	
	function loadHandler() {
		const url = '${cpath}/test2'
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			let arr = json.body.items.item
			const root = document.getElementById('root')
			
			// 배열에서 부산 관련 정보만 남기세요
			arr = arr.filter(item => item.gubun == '부산')
			// 각 항목의 사용하지 않는 속성을 제거하세요
			arr = arr.map(item => {
				delete item.gubunCn
				delete item.gubunEn
				delete item.overFlowCnt
				return item
			})
			// 날짜기준 오름차순으로 정렬하세요
			arr = arr.sort(item => item.stdDay)
			
			arr.forEach(dto => root.appendChild(convert(dto))) // arr의 각 요소를 dto라고 할때 각 요소에 convert(dto)를 root에 추가
		})
	}
	
	
</script>

<h1>ex02 - 직접 서버에 요청하여 화면에 출력하기</h1>
<hr>

<div id="root"></div>

<script>
	window.addEventListener('load', loadHandler)
</script>


</body>
</html>