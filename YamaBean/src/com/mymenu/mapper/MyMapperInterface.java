package com.mymenu.mapper;

import java.util.List;

import com.mymenu.dto.MyMenuDomain;

public interface MyMapperInterface {
	
	public String addMyMenu(MyMenuDomain mymenuDomain);	//mymenu ���
	
	public String removeMyMenu(int mymenu_num) ; //mymenu ����
	
	public List<MyMenuDomain> viewMyMenuList(); //mymenu ����Ʈ
	
	public String replaceMyMenu(MyMenuDomain mymenuDomain);	//mymenu ����
	
	public MyMenuDomain detailViewMyMenu(int mymenu_num, MyMenuDomain mymenuDomain); //mymenu �󼼺���

}
