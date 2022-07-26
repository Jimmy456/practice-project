package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("ex01")
	public void ex01() {}
	
	@GetMapping("ex02")
	public void ex02() {}
	
	@GetMapping("ex03")
	public void ex03() {}
}
