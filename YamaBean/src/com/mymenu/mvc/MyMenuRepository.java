package com.mymenu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mymenu.dto.MyMenuDomain;
import com.mymenu.mapper.MyMapperInterface;

@Repository
public class MyMenuRepository implements MineRepositoryInterface {

	@Autowired
	private MyMapperInterface myMenuMapper ;

	
	@Override
	public String register(MyMenuDomain mymenuDomain) {
		return myMenuMapper.addMyMenu(mymenuDomain);
	}

	@Override
	public String deleteMyMenu(int mymenu_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyMenuDomain> mymenuList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateMyMenu(MyMenuDomain mymenuDomain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MyMenuDomain detailMyMenu(int mymenu_num, MyMenuDomain mymenuDomain) {
		// TODO Auto-generated method stub
		return null;
	}

}
