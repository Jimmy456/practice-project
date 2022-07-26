<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div>
		<details>
			<summary>SQL</summary>
			<fieldset>
				<pre>
-- day06
-- member 테이블과 board 테이블 연동
-- board의 writer는 member에 등록된 userid만 참조가능
-- 게시글을 작성하려면 작성자는 회원가입된 사용자여야 한다
-- 외래키 제약조건을 사용하려면 Primary Key 혹은 Unique만 가능

-- 회원	(가입(해시), 로그인, 로그아웃, 마이페이지, 탈퇴)
-- 게시판	(목록, 검색, 작성(파일 업로드), 보기, 수정, 삭제)

drop sequence member4_seq;
drop sequence board2_seq;

create sequence member4_seq
	start with 1
	maxvalue 999999999
	increment by 1
	nocycle
	nocache;

create sequence board2_seq
	start with 1
	maxvalue 999999999
	increment by 1
	nocycle
	nocache;

drop table member4;
drop table board2;

create table member4 (
	idx		number 		default member4_seq.nextval primary key,
	userid		varchar2(100)	unique not null,
	userpw		varchar2(255)	not null,
	name		varchar2(100)	not null,
	email		varchar2(200)	not null,
	birth		date		not null,
	deleted		char(1)		default 'n' check(deleted in ('y', 'n'))
);

insert into member4 values (
	member4_seq.nextval,
	'test', '1234', '테스트', 'test@naver.com', '1990-01-01', 'n'
);

insert into member4 values (
	member4_seq.nextval,
	'itbank', 'it', '아이티뱅크', 'itbank@naver.com', '1995-05-12', 'n'
);

create table board2 (
	idx		number		default board2_seq.nextval primary key,
	category	varchar2(100)	check(category in ('공지', '일반', '게임', '등산', '여행')),
	title		varchar2(200)	not null,
	writer		varchar2(100)	,
	content		varchar2(2000)	not null,
	writeDate	date		default sysdate,
	viewCount	number		default 0,
	uploadFile	varchar2(255)	,
	ipaddr		varchar2(20)	not null,
	deleted		char(1)		default 'n' check(deleted in ('y','n')),
	
	constraint board2_member4_fk
	foreign key(writer)
	references member4(userid)
	--on delete set null	-- 계정을 삭제하면 null로 변경한다(작성자가 null이됨)
	on delete cascade	-- 계정을 삭제하면 게시글도 사라진다
);

insert into board2 (category, title, writer, content, ipaddr) values (
	'공지', '첫번째 게시글', 'itbank', '회원 연동 게시판 테스트', '1.1.1.1'
);

insert into board2 (category, title, writer, content, ipaddr) values (
	'일반', '일반 게시글', 'test', 'ㅋㅋㅋㅋㅋ', '1.1.1.2'
);

				
				</pre>
			</fieldset>
		</details>
		
		<details>
			<summary>구현할 기능</summary>
			<fieldset>
			<ul>
				<li>회원
					<ul>
						<li>회원 가입</li>
						<li>로그인/로그아웃</li>
						<li>마이페이지</li>
						<li>비밀번호 변경</li>
						<li>개인정보 변경</li>
						<li>탈퇴</li>
					</ul>
				</li>
				<li>게시판
					<ul>
						<li>전체 목록</li>
						<li>검색 목록</li>
						<li>글 읽기</li>
						<li>글 쓰기</li>
						<li>수정</li>
						<li>삭제</li>
					</ul>
				</li>
				<li>
					회원로그인 시에만 접근 가능한 메뉴들
					<ul>
						<li>로그아웃</li>					
						<li>마이페이지</li>					
						<li>비밀번호 변경</li>					
						<li>개인정보 변경</li>					
						<li>탈퇴</li>					
						<li>글 쓰기</li>					
						<li>수정</li>					
						<li>삭제</li>					
					</ul>
					
				</li>
			</ul>
			</fieldset>
		</details>
	</div>
</section>

</body>
</html>