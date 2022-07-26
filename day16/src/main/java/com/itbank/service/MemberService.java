package com.itbank.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {
	
	private String uploadPath = "D:\\upload";
	@Autowired private MemberDAO dao;
	
	public MemberService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}

	public int join(MemberDTO dto) throws IllegalStateException, IOException {
		
		MultipartFile f = dto.getProfileImg();
		
		if(f.getOriginalFilename().equals("") == false) {
			File dest = new File(uploadPath, f.getOriginalFilename());
			f.transferTo(dest);
			dto.setImg(f.getOriginalFilename());
		}
		return dao.insert(dto);
	}

}
