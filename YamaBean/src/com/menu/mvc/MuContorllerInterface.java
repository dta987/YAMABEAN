package com.menu.mvc;

import java.util.List;

import org.springframework.ui.Model;

import com.member.dto.Member;
import com.menu.dto.MenuDomain;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;

public interface MuContorllerInterface {

	public String createMenu(MenuDomain menuDomain); // 메뉴추가

	public String deleteMenu(int menu_num); // 메뉴추가, 삭제

	/* public String menuList(String mode, String keyword, Model model); */
	public List<MenuModel> menuList(); // 메뉴리스트

	
	
	/*public String alertMenu(MenuDomain menuDomain, Model model); // 메뉴수정 */	
	public MenuDomain updateMenuForm(int menu_num, MenuDomain menuDomain); //메뉴수정

	public String updateMenu(MenuDomain menuDomain); //메뉴수정
	
	
	
	

	public String searchMenu(int menu_num); // 메뉴찾기

}
