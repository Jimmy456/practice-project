package com.itbank.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Select("select userid from member4 order by userid")
	List<String> selectMemberUseridList();

	@Select("select * from member4 where userid={userid}")
	MemberDTO selectMember(String userid);

	
	
}
