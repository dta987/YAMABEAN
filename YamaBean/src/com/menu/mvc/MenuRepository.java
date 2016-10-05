package com.menu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuDomain;
import com.menu.mapper.MenuMapper;

@Repository
public class MenuRepository implements MuRepositoryInterface{

	@Autowired
	private MenuMapper menuMapper ;
	
	
	@Override
	public int createMenu(MenuEntity menuEntity) {
		return menuMapper.createMenu(menuEntity);
	}
	
	@Override
	public List<MenuEntity> selectList() {
		return menuMapper.selectList();
	}
	
	@Override 
	public MenuEntity selectByMenu(int menu_num) {
		return menuMapper.selectByMenu(menu_num);
	}

	
	@Override
	public int deleteMenu(int menu_num) {
		return menuMapper.deleteMenu(menu_num);
	}
	

	@Override
	public int updateMenu(MenuEntity menuEntity) {
		return menuMapper.updateMenu(menuEntity);
	}

	
	

	

}
