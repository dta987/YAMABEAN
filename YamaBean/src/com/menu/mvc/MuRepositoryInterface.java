package com.menu.mvc;

import java.util.List;

import com.member.dto.Member;
import com.menu.dto.Menu;

public interface MuRepositoryInterface {
	
	public int createMenu(Menu menu); // �޴��߰�

	public int updateMenu(Menu menu); // �޴�����
	
	public Menu selectByMenu(int pk); // �޴�ã��
	
	public int deleteMember(int pk); // �޴��߰�, ����

	public List<Menu> selectList(String mode, String keyword); // �������Ʈ
	
}
