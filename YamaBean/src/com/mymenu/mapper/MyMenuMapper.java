package com.mymenu.mapper;

import java.util.List;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;

public interface MyMenuMapper {
	
	public List<MenuEntity> allListMenu();	//menus 모든 리스트 불러오기
	
	public int addMyMenu(MyMenuDomain mymenuDomain);	//mymenu 등록
	
	public List<MyMenuModel> viewMyMenuList(); //mymenu 리스트
	public MenuEntity findByMenu(int menu_num);
	
	public int removeMyMenu(int mymenu_num) ; //mymenu 삭제

	public MyMenuModel detailViewMyMenu(int mymenu_num);	//mymenu 수정(mymenu_num으로 찾기)

	public int updateMyMenus(MyMenuDomain mymenuDomain);
		
	
	


}
