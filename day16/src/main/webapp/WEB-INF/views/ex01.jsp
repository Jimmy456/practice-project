<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function submitHandler(event) {
		event.preventDefault()
		alert('핸들러 작동 !!')
		
		const formData = new FormData(event.target)
// 		const ob = {}
		
		const url = '${pageContext.request.contextPath}/ex01'
		const opt = {
			method: 'POST',
			body: formData	// file을 포함하므로 JSON.stringify(formData) 를 수행하지 않음
			// 만약 formData에 파일정보가 포함된다면
			// headers를 작성하는 것이 오히려 방해가 된다
			// 직접 작성해서 넘기면 fetch API가 Content-Type을 지정할 수 없기 때문에 (multipart/form-data)
		}
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => alert(text))
	}
</script>

<h1>ex01 - ajax 파일 업로드</h1>
<hr>


<form>
	<p><input type="file" name="file"></p>
	<p><input type="text" name="memo" placeholder="메모"></p>
	<p><input type="submit"></p>
</form>

<script>
	const form = document.forms[0]
	form.addEventListener('submit', submitHandler)
	
</script>

</body>
</html>