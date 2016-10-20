package com.mymenu.mapper;

import java.util.List;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;

public interface MyMenuMapper {
	
	public List<MenuEntity> allListMenu();	//menus ��� ����Ʈ �ҷ�����
	
	public int addMyMenu(MyMenuDomain mymenuDomain);	//mymenu ���
	
	public List<MyMenuModel> viewMyMenuList(); //mymenu ����Ʈ
	public MenuEntity findByMenu(int menu_num);
	
	public int removeMyMenu(int mymenu_num) ; //mymenu ����

	public MyMenuModel detailViewMyMenu(int mymenu_num);	//mymenu ����(mymenu_num���� ã��)

	public int updateMyMenus(MyMenuDomain mymenuDomain);
		
	
	


}
