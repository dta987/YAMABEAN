package com.mymenu.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;


public interface MineControllerInterface {
	
	public List<MenuModel> menusAllList() ; //menus 모든 리스트 불러오기

	public String registerMyMenu(MyMenuDomain mymenuDomain, HttpSession session);	//mymenu 등록
	
	public String deleteMyMenu(int mymenu_num) ; //mymenu 삭제
	
	public List<MyMenuModel> mymenuList(HttpSession session); //mymenu 리스트
	
	public String updateMyMenu(MyMenuDomain mymenuDomain, HttpSession session);	//mymenu 수정
	public MyMenuModel updateMyMenuForm(int mymenu_num) ;
	
}
