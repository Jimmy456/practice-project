package com.itbank.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

//	IDX      NOT NULL NUMBER        
//	USERID   NOT NULL VARCHAR2(100) 
//	USERPW   NOT NULL VARCHAR2(255) 
//	USERNAME NOT NULL VARCHAR2(100) 
//	BIRTH    NOT NULL DATE          
//	IMG               VARCHAR2(100)

public class MemberDTO {
	
	private int idx;
	private String userid; 
	private String userpw;
	private String username;
	private Date birth;
	private String img;					// dto.getProfileImg().getOriginalFileName();
	private MultipartFile profileImg;	// <input name="profileImg">
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public MultipartFile getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(MultipartFile profileImg) {
		this.profileImg = profileImg;
	}
	
	

}






