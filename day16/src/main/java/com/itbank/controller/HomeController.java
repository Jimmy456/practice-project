package com.itbank.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {

	@GetMapping("/ex01")
	public void ex01() {}
	
	@PostMapping("/ex01")
	@ResponseBody
//	public int ex01(String memo, MultipartFile file) {	// 자료형을 명시하므로, 파일 처리 가능
//	public int ex01(@RequestParam HashMap<String, Object> param) { 	// Object타입에서 파일 처리 불가능
	public int ex01(Ex01DTO dto) {	// dto도 내부 멤버 필드에 자료형이 명시되어 있으니까 파일 처리 가능
		
//		System.out.println(memo);
//		System.out.println(file.getOriginalFilename());
		
//		System.out.println(param.get("memo"));
//		System.out.println(param.get("file"));
		
		System.out.println(dto.getMemo());
		System.out.println(dto.getFile().getOriginalFilename());
		
		return 1;
	}
}










