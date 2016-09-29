package com.member.mvc;

import java.util.List;

import com.member.dto.Member;

public interface MRepositoryInterface {
	
	public int insertMember(Member member); // 회원가입

	public Member selectByMember(String id); // 로그인

	public Member selectByMember(String name, String id, String email); // ID,PW찾기

	public List<Member> selectByList(String mode, String keyword); // 멤버리스트, 검색

	public int overLapCheck(String mode, String keyword); // 종복검사 ID, 이메일, 닉네임

	public int deleteMember(String id); // 회원삭제, 회원탈퇴

	public Member updateMember(Member member); // 회원 수정

}
