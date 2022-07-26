package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.TodoService;
import com.itbank.todo.TodoDTO;

@RestController
@RequestMapping("/todo")
public class TodoController {
	
	@Autowired private TodoService service;
	
	@GetMapping
	public List<TodoDTO> selectList() {
		return service.selectList();
	}
	
	@PostMapping
	public int insert(@RequestBody TodoDTO dto) {
		return service.insert(dto);
	}
	
	@DeleteMapping("/{idx}")
	public int delete(@PathVariable int idx) {
		return service.delete(idx);
	}
	
}
