package com.mymenu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;
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
	public List<MyMenuModel> mymenuList(String member_id) {
		return myMenuMapper.viewMyMenuList(member_id);
	}
	
	@Override
	public int deleteMyMenu(int mymenu_num) {
		return myMenuMapper.removeMyMenu(mymenu_num);
	}

	@Override
	public MyMenuModel selectByMenu(int mymenu_num) {
		return myMenuMapper.detailViewMyMenu(mymenu_num);
	}
	

	@Override
	public int updateMyMenu(MyMenuDomain mymenuDomain) {
		return myMenuMapper.updateMyMenus(mymenuDomain);
	}

	public Member selectByMember(String member_id) {
		return myMenuMapper.selectByMember(member_id);
	}

	


	

}
