package com.mymenu.mapper;

import java.util.List;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;

public interface MyMenuMapper {
	
	public List<MenuEntity> allListMenu();	//menus 모든 리스트 불러오기
	
	public int addMyMenu(MyMenuDomain mymenuDomain);	//mymenu 등록
	
	public List<MyMenuDomain> viewMyMenuList(); //mymenu 리스트
	
	public int removeMyMenu(int mymenu_num) ; //mymenu 삭제
		
	public int replaceMyMenu(MyMenuDomain mymenuDomain);	//mymenu 수정
	
	public MyMenuDomain detailViewMyMenu(int mymenu_num, MyMenuDomain mymenuDomain); //mymenu 상세보기

	


}
