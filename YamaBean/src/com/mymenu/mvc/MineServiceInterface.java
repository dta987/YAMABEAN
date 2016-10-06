package com.mymenu.mvc;

import java.util.List;

import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;

public interface MineServiceInterface {
	
	public String register(MyMenuDomain mymenuDomain);	//mymenu ���
	
	public String deleteMyMenu(int mymenu_num) ; //mymenu ����
	
	public List<MyMenuDomain> mymenuList(); //mymenu ����Ʈ
	
	public String updateMyMenu(MyMenuDomain mymenuDomain);	//mymenu ����
	
	public MyMenuDomain detailMyMenu(int mymenu_num, MyMenuDomain mymenuDomain); //mymenu �󼼺���

}
