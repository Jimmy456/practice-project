package com.itbank.board;

import java.sql.Date;

public class ReplyDTO {
	private int idx;
	private int boardIdx;
	private String writer;
	private String content;
	private Date writeDate;
	
	@Override
	public String toString() {	// jsp에서 사용하는 것이 아니고, 개발 서버 콘솔에서 확인하기 위한 용도
		return String.format("{%s, %s, %s, %s, %s}", idx, boardIdx, writer, content, writeDate);
	}
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
