package com.itbank.kyochon;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface KyochonDAO {
	
	@Select("select * from kyochon_menu order by idx")
	List<KyochonDTO> selectList();

	@Delete("delete kyochon_menu where idx = #{idx}")
	int delete(int idx);
}
