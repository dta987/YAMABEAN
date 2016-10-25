package com.mymenu.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;


public interface MineControllerInterface {
	
	public List<MenuModel> menusAllList() ; //menus ��� ����Ʈ �ҷ�����

	public String registerMyMenu(MyMenuDomain mymenuDomain, HttpSession session);	//mymenu ���
	
	public String deleteMyMenu(int mymenu_num) ; //mymenu ����
	
	public List<MyMenuModel> mymenuList(HttpSession session); //mymenu ����Ʈ
	
	public String updateMyMenu(MyMenuDomain mymenuDomain, HttpSession session);	//mymenu ����
	public MyMenuModel updateMyMenuForm(int mymenu_num) ;
	
}
