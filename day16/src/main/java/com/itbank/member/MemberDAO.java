package com.itbank.member;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	// 어노테이션 쿼리문을 작성할때도, <script> 태그 안에서 쓰면 동적 SQL을 사용할 수 있다
	// XML에서 작성하는 동적SQL이 가독성이 더 좋다
	@Insert("<script>"
			+ "insert into member5 (userid, userpw, username, "
			
			+ "<if test='img != null'>img,</if> "
			
			+ "birth) values ("
			+ "	#{userid}, #{userpw}, #{username},"
			
			+ "		<if test='img != null'>#{img},</if>"
			
			+ "	#{birth}"
			+ ")"
			+ "</script>")
	int insert(MemberDTO dto);

}
