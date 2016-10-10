package com.mymenu.mapper;

import java.util.List;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;

public interface MyMenuMapper {
	
	public List<MenuEntity> allListMenu();	//menus ��� ����Ʈ �ҷ�����
	
	public int addMyMenu(MyMenuDomain mymenuDomain);	//mymenu ���
	
	public List<MyMenuDomain> viewMyMenuList(); //mymenu ����Ʈ
	
	public int removeMyMenu(int mymenu_num) ; //mymenu ����
		
	public int replaceMyMenu(MyMenuDomain mymenuDomain);	//mymenu ����
	
	public MyMenuDomain detailViewMyMenu(int mymenu_num, MyMenuDomain mymenuDomain); //mymenu �󼼺���

	


}
