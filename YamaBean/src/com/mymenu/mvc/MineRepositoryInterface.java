package com.mymenu.mvc;

import java.util.List;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;

public interface MineRepositoryInterface {
	
	public List<MenuEntity> menuAllList();	//menus 모든 리스트 불러오기
	
	public int register(MyMenuDomain mymenuDomain);	//mymenu 등록
	
	public int deleteMyMenu(int mymenu_num) ; //mymenu 삭제
	
	public List<MyMenuModel> mymenuList(String member_id); //mymenu 리스트
	
	public MyMenuModel selectByMenu(int mymenu_num);	//mymenu 수정(mymenu_num으로 찾기)
	public int updateMyMenu(MyMenuDomain mymenuDomain);

}
