package com.member.mvc;

import org.springframework.ui.Model;

import com.member.dto.Member;

public interface MContorllerInterface {

	public String createMember(Member member); // 회원가입

	public String login(String id, String password, Model model); // 로그인

	public String forgottenID(String name, String email, Model model); // ID찾기

	public String forgottenPW(String name, String email, String id, Model model); // PW찾기

	public String overLapCheck(String mode, String keyword); // 종복검사

	public String memberList(String mode, String keyword, Model model); // 멤버리스트

	public String deleteMember(String id); // 회원삭제, 회원탈퇴

	public String alertMember(Member member, Model model); // 회원 수정

}
