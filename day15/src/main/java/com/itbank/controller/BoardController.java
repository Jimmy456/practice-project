package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;

@RestController		// @ResponseBody가 모든 메서드에 적용된다
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardDAO dao;
	
	@GetMapping("/{offset}")
	public List<BoardDTO> selectList(@PathVariable int offset) {
		return dao.selectList(offset);
	}
}
