package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/join")
	public void join() {}
	
	@GetMapping("/login")
	public void login(String url) {
		System.out.println("전달받은 url" + url);
	}
	
	@PostMapping("/login")
	public String login(String url, HttpSession session) {
		System.out.println("로그인 이후 이동할 url : " + url);
		session.setAttribute("login", "이지은");
		session.setMaxInactiveInterval(60);
		return "redirect:" + (url == null ? "/" : url);
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/mypage")
	public void mypage() {}
	
}
