package com.member.mvc;

import java.util.List;

import org.springframework.stereotype.Service;

import com.member.dto.Member;

public interface MServiceInterface {

	public int addMember(Member member); // ȸ������

	public boolean findByMember(String id, String password); // �α���

	public Member findByMember(String id); // ȸ���˻�

	public int findByMember(String name, String id, String email); // ID,PWã��

	public boolean overLapCheck(String mode, String keyword); // �����˻� ID, �̸���,
																// �г���

	public List<Member> findByList(String mode, String keyword); // �������Ʈ, �˻�

	public int removeMember(String id); // ȸ������, ȸ��Ż��

	public Member modifyMember(Member member); // ȸ�� ����

}
