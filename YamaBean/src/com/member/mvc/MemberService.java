package com.member.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.dto.Member;

@Service
public class MemberService{

	@Autowired
	private MemberRepository memberRepository;

	public int addMember(Member member) {
		return memberRepository.insertMember(member);
	}

	public boolean findByMember(String id, String password) {

		boolean loginCondition = false;

		Member member = new Member();

		if (memberRepository.selectByMember(id) != null) {
			member = memberRepository.selectByMember(id);
		}

		if (id.equals(member.getId())) {
			if (password.equals(member.getPassword())) {
				loginCondition = true;

			} else {
				loginCondition = false;
			}
		} else {
			loginCondition = false;
		}

		return loginCondition;
	}

	public Member findByMember(String id) {

		return memberRepository.selectByMember(id);
	}

	public int findByMember(String name, String id, String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean overLapCheck(String mode, String keyword) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<Member> findByList(String mode, String keyword) {		
		return memberRepository.selectByList(mode, keyword);
	}

	public int removeMember(String id) {
		return memberRepository.deleteMember(id);
	}

	public Member updateMember(String id) {

		return memberRepository.selectByMember(id);
	}

	public Member modifyMember(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

}
