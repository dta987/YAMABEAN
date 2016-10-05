package com.member.mvc;

import java.util.List;

import org.springframework.stereotype.Service;

import com.member.dto.Member;

public interface MServiceInterface {

	public int addMember(Member member); // 회원가입

	public boolean findByMember(String id, String password); // 로그인

	public Member findByMember(String id); // 회원검색

	public int findByMember(String name, String id, String email); // ID,PW찾기

	public boolean overLapCheck(String mode, String keyword); // 종복검사 ID, 이메일,
																// 닉네임

	public List<Member> findByList(String mode, String keyword); // 멤버리스트, 검색

	public int removeMember(String id); // 회원삭제, 회원탈퇴

	public Member modifyMember(Member member); // 회원 수정

}
