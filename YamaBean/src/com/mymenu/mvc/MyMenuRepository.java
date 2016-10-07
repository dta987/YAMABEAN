package com.mymenu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.mapper.MyMenuMapper;

@Repository
public class MyMenuRepository implements MineRepositoryInterface {

	@Autowired
	private MyMenuMapper myMenuMapper ;

	@Override
	public List<MenuEntity> menuAllList() {
		return myMenuMapper.allListMenu();
	}
	
	@Override
	public int register(MyMenuDomain mymenuDomain) {
		return myMenuMapper.addMyMenu(mymenuDomain);
	}

	@Override
	public List<MyMenuDomain> mymenuList() {
		return myMenuMapper.viewMyMenuList();
	}
	
	@Override
	public int deleteMyMenu(int mymenu_num) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateMyMenu(MyMenuDomain mymenuDomain) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MyMenuDomain detailMyMenu(int mymenu_num, MyMenuDomain mymenuDomain) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
