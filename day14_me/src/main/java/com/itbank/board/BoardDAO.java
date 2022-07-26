package com.itbank.board;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardDAO {

	@Select("select * from board2 order by idx desc")
	List<BoardDTO> selectAll();

	@Insert("insert into board2 (title, writer, content, ipaddr) "
			+ "values (#{title}, #{writer}, #{content}, #{ipaddr})")
	int insert(BoardDTO dto);
	
	@Update("update board2 set deleted = 'y' where idx = #{idx}")
	int delete(int idx);
	
}
