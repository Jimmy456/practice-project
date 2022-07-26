package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@GetMapping("/list")
	public void list() {}
	
	@GetMapping("/view")
	public void view() {}
	
	@GetMapping("/write")
	public void write() {}
	
	@GetMapping("/modify")
	public void modify() {}
	
	@GetMapping("/delete")
	public void delete() {}
}
