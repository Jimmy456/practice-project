package com.itbank.board;

import java.sql.Date;

//	IDX        NOT NULL NUMBER         
//	CATEGORY            VARCHAR2(100)  
//	TITLE      NOT NULL VARCHAR2(200)  
//	WRITER     NOT NULL VARCHAR2(100)  
//	CONTENT    NOT NULL VARCHAR2(2000) 
//	WRITEDATE           DATE           
//	VIEWCOUNT           NUMBER         
//	UPLOADFILE          VARCHAR2(255)  
//	IPADDR     NOT NULL VARCHAR2(20)   
//	DELETED             CHAR(1)  


public class BoardDTO {
	
	private int idx, viewCount;
	private String category, title, writer, content, ipaddr, uploadFile, deleted;
	private Date writeDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	

}
