package com.menu.mvc;

import java.util.List;

import org.springframework.ui.Model;

import com.member.dto.Member;
import com.menu.dto.MenuDomain;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;

public interface MuContorllerInterface {

	public String createMenu(MenuDomain menuDomain); // �޴��߰�

	public String deleteMenu(int menu_num); // �޴��߰�, ����

	/* public String menuList(String mode, String keyword, Model model); */
	public List<MenuModel> menuList(); // �޴�����Ʈ

	
	
	/*public String alertMenu(MenuDomain menuDomain, Model model); // �޴����� */	
	public MenuDomain updateMenuForm(int menu_num, MenuDomain menuDomain); //�޴�����

	public String updateMenu(MenuDomain menuDomain); //�޴�����
	
	
	
	

	public String searchMenu(int menu_num); // �޴�ã��

}
