package com.member.mapper;

import java.util.List;

import com.admin.dto.OrderList;
import com.member.dto.Forgotten;
import com.member.dto.Member;
import com.member.dto.OvelapCheck;

public interface MemberMapper {

	public int insertMember(Member member); // 회원가입

	public Member selectByMember(String id); // 로그인

	public Member selectByMember(String name, String id, String email); // ID,PW찾기

	public List<Member> selectByList(String mode, String keyword); // 멤버리스트, 검색

	public Member forgotten(Forgotten forgotten); // 종복검사 ID, 이메일, 닉네임

	public int deleteMember(String id); // 회원삭제, 회원탈퇴

	public int updateMember(Member member); // 회원 수정

	public List<OrderList> selectByOrderList(String id);

	public Member overLapCheckNickName(String keyword);

	public Member overLapCheckID(String keyword);

	public Member overLapCheckEmail(String keyword);

}
