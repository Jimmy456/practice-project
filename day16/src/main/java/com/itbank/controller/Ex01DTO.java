package com.itbank.controller;

import org.springframework.web.multipart.MultipartFile;

public class Ex01DTO {

	private String memo;
	private MultipartFile file;
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
