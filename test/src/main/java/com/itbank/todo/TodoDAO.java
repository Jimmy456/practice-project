package com.itbank.todo;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface TodoDAO {

	@Select("select * from todoList")
	List<TodoDTO> selectList();

	@Insert("insert into todoList (title, content) values ( #{title}, #{content} )")
	int insert(TodoDTO dto);

	@Delete("delete from todoList where idx = #{idx}")
	int delete(int idx);

}
