package com.itbank.gallery;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface GalleryDAO {

	@Select("select * from gallery order by idx")
	List<GalleryDTO> selectList();

	@Insert("insert into gallery (img, memo) values ( #{img}, #{memo} )")
	int insert(GalleryDTO dto);

	@Select("select * from gallery where idx = #{idx}")
	GalleryDTO getDTO(int idx);
	
}
