package com.member.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jdk.nashorn.internal.ir.annotations.Reference;

import com.admin.dto.OrderList;
import com.member.dto.Forgotten;
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

	public Member overLapCheck(Forgotten forgotten) {

		return MemberMapper.overLapCheck(forgotten);
	}

	public int deleteMember(String id) {
		return MemberMapper.deleteMember(id);
	}

	public Member updateMember(Member member) {
		return MemberMapper.updateMember(member);
	}

	public List<OrderList> selectByOrderList(String id) {
		return MemberMapper.selectByOrderList(id);
	}

}
