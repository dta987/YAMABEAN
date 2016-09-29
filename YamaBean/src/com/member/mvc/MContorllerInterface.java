package com.member.mvc;

import org.springframework.ui.Model;

import com.member.dto.Member;

public interface MContorllerInterface {

	public String createMember(Member member); // ȸ������

	public String login(String id, String password, Model model); // �α���

	public String forgottenID(String name, String email, Model model); // IDã��

	public String forgottenPW(String name, String email, String id, Model model); // PWã��

	public String overLapCheck(String mode, String keyword); // �����˻�

	public String memberList(String mode, String keyword, Model model); // �������Ʈ

	public String deleteMember(String id); // ȸ������, ȸ��Ż��

	public String alertMember(Member member, Model model); // ȸ�� ����

}
