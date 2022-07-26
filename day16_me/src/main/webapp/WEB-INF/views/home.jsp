<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
</head>
<body>

<script>
	function deleteHandler(event) {
		const flag = comfirm('정말 삭제하시겠습니까')
		if(flag == false) {
			return
		}
		const item = event.target.parentNode.parentNode
		const idx = item.getAttribute('idx')
		const url = '${cpath}/gallery/' + idx
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
	
	
	
</script>

<h1>board2</h1>
<hr>

<div class="write">
	<form>
		<input type="hidden" name="ipaddr" value="${pageContext.request.remoteAddr }">
		<p><input type="text" name="title" placeholder="제목"></p>
		<p><input type="text" name="writer" placeholder="작성자"></p>
		<p><textarea name="content" placeholder="내용을 작성하세요"></textarea></p>
		<p><input type="submit" value="등록"></p>
	</form>
</div>

<div class="wrap" offset="0"></div>

<script>
	const wrap = document.querySelector('.wrap')
	const writeForm = document.forms[0]
	
	window.addEventListener('load', selectAll)
	window.addEventListener('scroll', scrollHandler)
	writeForm.addEventListener('submit', writeHandler)
</script>

</body>
</html>