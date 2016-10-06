package com.member.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.dto.Member;

@Service
public class MemberService implements MServiceInterface {

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public int addMember(Member member) {
		return memberRepository.insertMember(member);
	}

	@Override
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

	@Override
	public Member findByMember(String id) {

		return memberRepository.selectByMember(id);
	}

	@Override
	public int findByMember(String name, String id, String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean overLapCheck(String mode, String keyword) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Member> findByList(String mode, String keyword) {		
		return memberRepository.selectByList(mode, keyword);
	}

	@Override
	public int removeMember(String id) {
		return memberRepository.deleteMember(id);
	}

	public Member updateMember(String id) {

		return memberRepository.selectByMember(id);
	}

	@Override
	public Member modifyMember(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

}
