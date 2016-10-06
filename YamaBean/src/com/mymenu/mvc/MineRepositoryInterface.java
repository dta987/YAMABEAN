package com.mymenu.mvc;

import java.util.List;

import com.mymenu.dto.MyMenuDomain;

public interface MineRepositoryInterface {
	
	public String register(MyMenuDomain mymenuDomain);	//mymenu 등록
	
	public String deleteMyMenu(int mymenu_num) ; //mymenu 삭제
	
	public List<MyMenuDomain> mymenuList(); //mymenu 리스트
	
	public String updateMyMenu(MyMenuDomain mymenuDomain);	//mymenu 수정
	
	public MyMenuDomain detailMyMenu(int mymenu_num, MyMenuDomain mymenuDomain); //mymenu 상세보기

}
