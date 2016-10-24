package com.member.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.admin.dto.OrderList;
import com.member.dto.Forgotten;
import com.member.dto.Member;
import com.member.dto.OvelapCheck;
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

	public Member forgotten(Forgotten forgotten) {

		return MemberMapper.forgotten(forgotten);
	}

	public int deleteMember(String id) {
		return MemberMapper.deleteMember(id);
	}

	public int updateMember(Member member) {
		return MemberMapper.updateMember(member);
	}

	public List<OrderList> selectByOrderList(String id) {
		return MemberMapper.selectByOrderList(id);
	}

	public Member overLapCheckID(String keyword) {
		return MemberMapper.overLapCheckID(keyword);
	}
	public Member overLapCheckNickName(String keyword) {
		return MemberMapper.overLapCheckNickName(keyword);
	}
	public Member overLapCheckEmail(String keyword) {
		return MemberMapper.overLapCheckEmail(keyword);
	}

	public List<OrderList> findBylatelyOrderList(String id) {
		return MemberMapper.findBylatelyOrderList(id);
	}

}
