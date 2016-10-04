package com.menu.mvc;

import java.util.List;

import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuDomain;

public interface MuRepositoryInterface {
	
	public int createMenu(MenuEntity menuEntity); // �޴��߰�

	public int updateMenu(MenuEntity menuEntity); // �޴�����
	
	public MenuEntity selectByMenu(int menu_num); // �޴�ã��
	
	public int deleteMenu(int menu_num); // �޴��߰�, ����

	/*public List<MenuEntity> selectList(String mode, String keyword); // �޴�����Ʈ */	
	public List<MenuEntity> selectList(); // �޴�����Ʈ
	
}
