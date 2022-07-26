package com.itbank.kfc;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface KfcDAO {
	
	@Select("select * from kfc_menu order by idx")
	List<KfcDTO> selectList();
}
