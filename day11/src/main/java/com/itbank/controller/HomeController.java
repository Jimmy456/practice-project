package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/sample1")
	public void sample1() {}
	
	@GetMapping("/sample2")
	public void sample2() {}
	
	@GetMapping("/sample3")
	public void sample3() {}
	
}
