package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;

@RestController
@RequestMapping("/board")
public class AjaxController {

	@Autowired private BoardDAO dao;
	
	@GetMapping
	public List<BoardDTO> selectAll() {
		return dao.selectAll();
	}
	
	@PostMapping
	public int write(@RequestBody BoardDTO dto) {
		return dao.insert(dto);
	}
	
	@DeleteMapping("/{idx}")
	public int delete(@PathVariable int idx) {
		return dao.delete(idx);
	}
}
