package com.member.mvc;

import java.util.List;

import com.member.dto.Member;

public interface MRepositoryInterface {
	
	public int insertMember(Member member); // ȸ������

	public Member selectByMember(String id); // �α���

	public Member selectByMember(String name, String id, String email); // ID,PWã��

	public List<Member> selectByList(String mode, String keyword); // �������Ʈ, �˻�

	public int overLapCheck(String mode, String keyword); // �����˻� ID, �̸���, �г���

	public int deleteMember(String id); // ȸ������, ȸ��Ż��

	public Member updateMember(Member member); // ȸ�� ����

}
