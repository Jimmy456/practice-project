package com.itbank.model;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface TestDAO {

	@Select("select banner from v$version")
	String selectVersion();
	
	
	
}
