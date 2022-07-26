<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day18</title>
<style>
	.item {
		width: 300px;
		border: 1px solid black;
		padding: 10px;
	}
	.flex {
		display: flex;
		justify-content: space-around;
	}
	details {
		cursor: pointer;
	}
</style>
</head>
<body>
<script>
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

	
	function loadHandler() {
		fetch('${cpath}/test2')
		.then(resp => resp.json())
		.then(json => {
			let arr = json.body.items.item
			arr = arr.filter(item => item.gubun == '부산')
			arr = arr.map(item => {
				return {
					'날짜' : item.stdDay.substring(0, 13),
					'누적 감염자 수' : item.defCnt,
					'누적 사망자 수' : item.deathCnt,
					'일일 감염자 수' : item.incDec,
					'지역 발생자 수' : item.localOccCnt,
					'외부 유입 수' : item.overFlowCnt,
					'10만명 당 감염자': item.qurRate
				}
			})
			const root = document.getElementById('root')
			// 값에 해당하는 내용을 반복하여 추가하기
			arr.forEach(dto => root.appendChild(convert(dto)))
		})	
	}
</script>

<h1>day18</h1>
<hr>

<div id="root"></div>

<script>
	window.addEventListener('load', loadHandler)
</script>

</body>
</html>