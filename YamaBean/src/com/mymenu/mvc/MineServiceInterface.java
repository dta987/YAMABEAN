package com.mymenu.mvc;

import java.util.List;

import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;

public interface MineServiceInterface {
	
	public List<MenuModel> menuAllList();	//menus 모든 리스트 불러오기
	
	public int register(MyMenuDomain mymenuDomain);	//mymenu 등록
	
	public int deleteMyMenu(int mymenu_num) ; //mymenu 삭제
	
	public List<MyMenuModel> mymenuList(); //mymenu 리스트
	
	public MyMenuModel findByMymenu(int mymenu_num) ;	//mymenu 수정 (mymenu_num으로 찾기)
	public int updateMyMenu(MyMenuDomain mymenuDomain) ;
	
}
