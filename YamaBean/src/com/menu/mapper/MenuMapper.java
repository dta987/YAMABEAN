package com.menu.mapper;

import java.util.List;

import com.menu.dto.MenuEntity;

public interface MenuMapper {
	
	public int createMenu(MenuEntity menuEntity); // �޴��߰�

	public int updateMenu(MenuEntity menuEntity); // �޴�����
	
	public MenuEntity selectByMenu(int menu_num); // �޴� num ã��
	
	public int deleteMenu(int menu_num); // �޴��߰�, ����

	/*public List<MenuEntity> selectList(String mode, String keyword); // �޴�����Ʈ */
	public List<MenuEntity> selectList(); // �޴�����Ʈ
}
