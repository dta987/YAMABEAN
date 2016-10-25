package com.mymenu.mvc;

import java.util.List;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;

public interface MineRepositoryInterface {
	
	public List<MenuEntity> menuAllList();	//menus ��� ����Ʈ �ҷ�����
	
	public int register(MyMenuDomain mymenuDomain);	//mymenu ���
	
	public int deleteMyMenu(int mymenu_num) ; //mymenu ����
	
	public List<MyMenuModel> mymenuList(String member_id); //mymenu ����Ʈ
	
	public MyMenuModel selectByMenu(int mymenu_num);	//mymenu ����(mymenu_num���� ã��)
	public int updateMyMenu(MyMenuDomain mymenuDomain);

}
