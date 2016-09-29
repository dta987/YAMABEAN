package com.menu.mapper;

import java.util.List;

import com.menu.dto.Menu;


public interface MenuMapper {
	
	public int createMenu(Menu menu); // �޴��߰�

	public int updateMenu(Menu menu); // �޴�����
	
	public Menu selectByMenu(int pk); // �޴�ã��
	
	public int deleteMember(int pk); // �޴��߰�, ����

	public List<Menu> selectList(String mode, String keyword); // �������Ʈ

}
