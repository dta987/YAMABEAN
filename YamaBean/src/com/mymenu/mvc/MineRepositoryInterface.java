package com.mymenu.mvc;

import java.util.List;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;

public interface MineRepositoryInterface {
	
	public List<MenuEntity> menuAllList();	//menus 모든 리스트 불러오기
	
	public int register(MyMenuDomain mymenuDomain);	//mymenu 등록
	
	public int deleteMyMenu(int mymenu_num) ; //mymenu 삭제
	
	public List<MyMenuDomain> mymenuList(); //mymenu 리스트
	
	public int updateMyMenu(MyMenuDomain mymenuDomain);	//mymenu 수정
	
	public MyMenuDomain detailMyMenu(int mymenu_num); //mymenu 상세보기

}
