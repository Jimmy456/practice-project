package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.todo.TodoDAO;
import com.itbank.todo.TodoDTO;

@Service
public class TodoService {

	@Autowired private TodoDAO dao;

	public List<TodoDTO> selectList() {
		return dao.selectList();
	}

	public int insert(TodoDTO dto) {
		return dao.insert(dto);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}
	
}
