package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.service.TestService;

@Controller
public class TestController {
	
	@Autowired private TestService testService;
	
	@GetMapping("/test")
	public String test() {
		// select banner from v$version;
		String version = testService.getVersion();
		return version;
	}
	
	
	@GetMapping("/test2")
	@ResponseBody	// 반환하는 값 그 자체가 응답이다(별도의 jsp를 찾아서 포워딩하지 않는다)
	public String test2() {
		// select banner from v$version;
		String version = testService.getVersion();
		return version;
	}
	
	
}
