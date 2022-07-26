package com.itbank.board;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardDAO {

	@Select("select * from board2 where deleted = 'n' order by idx desc "
			+ "offset #{offset} rows "
			+ "fetch next 10 rows only")
	List<BoardDTO> selectList(int offset);
		
}
