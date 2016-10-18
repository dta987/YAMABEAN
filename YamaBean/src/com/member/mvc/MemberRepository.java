package com.member.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jdk.nashorn.internal.ir.annotations.Reference;

import com.member.dto.Member;
import com.member.mapper.MemberMapper;

@Repository
public class MemberRepository{

	@Autowired
	private MemberMapper MemberMapper;

	public int insertMember(Member member) {
		return MemberMapper.insertMember(member);
	}

	public Member selectByMember(String id) {
		return MemberMapper.selectByMember(id);
	}

	public Member selectByMember(String name, String id, String email) {
		return MemberMapper.selectByMember(name, id, email);
	}

	public List<Member> selectByList(String mode, String keyword) {
		return MemberMapper.selectByList(mode, keyword);
	}

	public int overLapCheck(String mode, String keyword) {

		return MemberMapper.overLapCheck(mode, keyword);
	}

	public int deleteMember(String id) {
		return MemberMapper.deleteMember(id);
	}

	public int updateMember(Member member) {
		return MemberMapper.updateMember(member);
	}

}
