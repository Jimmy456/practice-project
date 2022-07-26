package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@RestController		// 하위 모든 메서드가 @ResponseBody를 포함한다
public class MemberController {

	@Autowired private MemberService memberService;
	
	@GetMapping("/member")
	public List<String> memberUseridList() {
		List<String> list = memberService.selectMemberUseridList();
		System.out.println(list);
		return list;
	}
	
	@GetMapping("/member/{userid}")
	public MemberDTO member(@PathVariable String userid) {
		MemberDTO dto = memberService.selectMember(userid);
		return dto;		// 자바 빈즈 객체를 반환하면 jackson-databind가 JSON으로 변환해서 반환한다
	}
	
}
