package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {

	@Autowired private MemberDAO memberDAO;
	
	public List<String> selectMemberUseridList() {
		return memberDAO.selectMemberUseridList();
	}

	public MemberDTO selectMember(String userid) {
		return memberDAO.selectMember(userid);
	}

}
