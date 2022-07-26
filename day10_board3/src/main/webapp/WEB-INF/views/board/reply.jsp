<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<!-- view에서는 GET만 사용하고 있다. 게시글 읽기 주소에서 POST가 작동하는건 댓글 작성 -->
	<form method="POST" class="replyForm">
		<c:set var="pl" value="로그인 사용자만 댓글을 작성할 수 있습니다" />
		<c:if test="${not empty login }">
			<c:set var="pl" value="바르고 고운 말을 사용합시다" />
		</c:if>
		<div class="sb">
			<div>${login.userid }</div>
			<div>			
				<textarea class="replyText"
				  name="content"
				  placeholder="${pl }"></textarea>
				<input type="submit" value="댓글작성">
			</div>
		</div>
		<input type="hidden" name="writer" value="${login.userid }">
	</form>
	
	<div>
	<c:forEach var="reply" items="${replyList }">
		<div class="reply">
			<div class="sb">
				<div>${reply.writer } | ${reply.writeDate }</div>
			</div>
				<a href="">수정</a>
				<a class="replyDeleteBtn"
				   href="${cpath }/board/deleteReply/${dto.idx }/${reply.idx}">삭제</a>
		</div>
		<div><pre>${reply.content }</pre></div>
	</c:forEach>
	</div>
	
</div>

<script>
	const replyText = document.querySelector('textarea.replyText')
	const replyForm = document.querySelector('form.replyForm')
	const replyWriter = document.querySelector('input[name="writer"]').value
	
	console.log(replyText)
	console.log(replyForm)
	console.log(replyWriter)
	
	const replyLoginHandler = function(event) {
		event.preventDefault()	// 클릭에 의해 작동하는 기본 처리를 중지한다
		console.log()
		
		if(replyWriter == '') {	// 자바스크립트의 문자열은 연산자로 비교 가능하다
			const flag = confirm('댓글을 작성하려면 로그인이 필요합니다.\n로그인 페이지로 이동하시겠습니까?')
			if(flag) {
				const currentURL = location.href
				location.href = '${cpath}/member/login?url=' + currentURL
			}
		}
		else if(event.target == replyForm && replyText.value == '') {
			alert('댓글 내용을 작성해야 합니다')
			replyText.focus()	// textarea에 커서를 이동시킨다
		}
		else if(event.type == 'submit') {
			event.target.submit()	// event.target 은 제출을 수행하려 하는 form
		}
	}
	
	replyText.onclick = replyLoginHandler	// textarea 를 클릭하면 작동
	replyForm.onsubmit = replyLoginHandler	// form 을 제출하면 작동
</script>

</section>