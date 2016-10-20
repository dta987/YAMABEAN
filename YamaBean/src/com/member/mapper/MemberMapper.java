package com.member.mapper;

import java.util.List;

import com.admin.dto.OrderList;
import com.member.dto.Forgotten;
import com.member.dto.Member;
import com.member.dto.OvelapCheck;

public interface MemberMapper {

	public int insertMember(Member member); // ȸ������

	public Member selectByMember(String id); // �α���

	public Member selectByMember(String name, String id, String email); // ID,PWã��

	public List<Member> selectByList(String mode, String keyword); // �������Ʈ, �˻�

	public Member forgotten(Forgotten forgotten); // �����˻� ID, �̸���, �г���

	public int deleteMember(String id); // ȸ������, ȸ��Ż��

	public int updateMember(Member member); // ȸ�� ����

	public List<OrderList> selectByOrderList(String id);

	public Member overLapCheckNickName(String keyword);

	public Member overLapCheckID(String keyword);

	public Member overLapCheckEmail(String keyword);

}
