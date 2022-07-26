package com.itbank.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberController {

	@Autowired private MemberService memberService;
	
	@PostMapping
	public int join(MemberDTO dto) throws IllegalStateException, IOException {
		return memberService.join(dto);
	}
}
