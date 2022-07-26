package com.itbank.board;

public class Paging {	// 전체 레코드 수를 일정한 단위 크기로 나누어서 보여주기
	private int page;				// 요청받은 페이지 (*)
	private int boardCount;			// 총 게시글의 개수 (*)
	private int perPage = 10;		// 화면당 출력할 게시글의 개수
	private int perSection = 10;	// 화면당 출력할 페이지의 개수
	
	private int offset;				// 쿼리문에서 건너뛸 레코드의 개수
	
	private int pageCount;			// 페이지 전체 개수
	private int begin;				// 쪽번호 시작 [1]
	private int end;				// 쪽번호 끝    [10]
	private boolean prev;			// 이전 버튼을 출력하는 조건
	private boolean next;			// 다음 버튼을 출력하는 조건
	
	public Paging(int page, int boardCount) {	// 생성자에서 요청받은 페이지와 총 게시글을 받아온다
		offset = (page - 1) * perPage;			// 건너뛸 개수
		begin = ((int)(page - 0.1) / perSection) * perSection + 1;
		end = begin + perSection - 1;
		boolean flag = boardCount % perPage != 0;	// 마지막 페이지에 남은 글이 있으면 페이지를 1더할 조건
		pageCount = boardCount / perPage + (flag ? 1 : 0);	// 조건에 따라서 페이지 개수를 1 증가한다
		end = end >= pageCount ? pageCount : end;	// 마지막 쪽번호는 전체 페이지수를 초과할 수 없다
		int section = (page - 1) / perSection;		// 현재 섹션은 요청받은 페이지를 이용하여 구간을 나눈다
		int lastSection = (pageCount - 1) / perSection;	// 페이지 개수를 토대로 마지막 섹션 번호를 구한다
		prev = begin > perSection;		// 이전 버튼은 현재 시작 쪽번호가 단위개수보다 클 경우에만 있다
		next = lastSection > section;	// 현재 섹션이 마지막 섹션보다 작은 경우에만 다음 버튼이 있다
	}
	
	public int getPerSection() {
		return perSection;
	}
	public void setPerSection(int perSection) {
		this.perSection = perSection;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	
}
