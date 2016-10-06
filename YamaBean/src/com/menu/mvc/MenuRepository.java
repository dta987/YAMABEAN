package com.menu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuDomain;
import com.menu.mapper.MenuMapper;

@Repository
public class MenuRepository{

	@Autowired
	private MenuMapper menuMapper ;
	
	
	public int createMenu(MenuEntity menuEntity) {
		return menuMapper.createMenu(menuEntity);
	}
	
	public List<MenuEntity> selectList() {
		return menuMapper.selectList();
	}
	
	public MenuEntity selectByMenu(int menu_num) {
		return menuMapper.selectByMenu(menu_num);
	}
	
	public int deleteMenu(int menu_num) {
		return menuMapper.deleteMenu(menu_num);
	}
	
	public int updateMenu(MenuEntity menuEntity) {
		return menuMapper.updateMenu(menuEntity);
	}

	
	

	

}
