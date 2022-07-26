package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.kyochon.KyochonDAO;
import com.itbank.kyochon.KyochonDTO;

@RestController
@RequestMapping("/")
public class AjaxController {
	// 1) 사용자가 주소를 통해서 CRUD를 구분할 수 있게 하지 말자
	// 2) 단일  요소를 원하면 primary key를 이용하여 탐색한다
	// 3) primary key가 없으면 전체 요소를 탐색한다
	// 4) 컨트롤러의 메서드가 반환하는 값은 [함수가 생산해내는 값, 만들어내는 값] produces
	// 5) 컨트롤러의 메서드가 전달받는 값은 [함수가 소비하는 값, 사용하는 값] consumes
	// 6) Cross-Origin Resource Sharing (CORS)
	//	자원을 요청하는 java-script와 자원을 제공하는 back-end 서버는 동일 도메인 안에 있어야 한다 -> front-end와 back-end 사이의 정책
	
	@Autowired private KyochonDAO dao;
	
	// select * from kyochon_menu
	@GetMapping(value="kyochon", produces="application/json; charset=utf-8")
	@CrossOrigin   // 다른 출저에서 자원을 요청해도 허용하겠다 (front에서 back으로 요청할 때만 해당)
	public List<KyochonDTO> selectAll() {
		return dao.selectList();
	}
	
	// select * from kyochon_menu where idx = {idx}
	@GetMapping("kyochon/{idx}")
	public String selectOne(@PathVariable int idx) {
		return idx + "번 정보";
	}
	
	// insert into kyochon_menu values (...)
	@PostMapping(value="kyochon", produces="text.html; charset=utf-8")
	public String insert(KyochonDTO dto) {
		System.out.println(dto.getName());
		System.out.println(dto.getPrice());
		System.out.println(dto.getCategory());
		System.out.println(dto.getMemo());
		String tag = "";
		tag += "<script>";
		tag += "	location.href = '%s'";
		tag += "</script>";
		tag = String.format(tag, "http://192.168.0.200:5500/javascript/ex14.html");
		
		return tag;
	}
	
	// update kyochon_menu set ... where idx
	@PutMapping("kyochon/{idx}")
	public void update(@PathVariable KyochonDTO dto) {}
	
	// delete kyochon_menu where idx = {idx}
	@DeleteMapping(value="kyochon/{idx}", produces="text/plain; charset=utf-8")
	@CrossOrigin
	public int delete(@PathVariable int idx) {
		return dao.delete(idx);
	}
}
