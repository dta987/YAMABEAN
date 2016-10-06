package com.mymenu.mapper;

import java.util.List;

import com.mymenu.dto.MyMenuDomain;

public interface MyMapperInterface {
	
	public String addMyMenu(MyMenuDomain mymenuDomain);	//mymenu 등록
	
	public String removeMyMenu(int mymenu_num) ; //mymenu 삭제
	
	public List<MyMenuDomain> viewMyMenuList(); //mymenu 리스트
	
	public String replaceMyMenu(MyMenuDomain mymenuDomain);	//mymenu 수정
	
	public MyMenuDomain detailViewMyMenu(int mymenu_num, MyMenuDomain mymenuDomain); //mymenu 상세보기

}
