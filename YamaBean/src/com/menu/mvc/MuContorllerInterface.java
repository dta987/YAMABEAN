package com.menu.mvc;

import org.springframework.ui.Model;

import com.member.dto.Member;
import com.menu.dto.Menu;

public interface MuContorllerInterface {

	public String createMenu(Menu menu); // �޴��߰�

	public String alertMenu(Menu menu, Model model); // �޴�����
	
	public String searchMenu(int pk); // �޴�ã��
	
	public String deleteMember(int pk); // �޴��߰�, ����

	public String menuList(String mode, String keyword, Model model); // �������Ʈ
	
}
