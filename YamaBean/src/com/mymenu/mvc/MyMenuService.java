package com.mymenu.mvc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;

@Service
public class MyMenuService implements MineServiceInterface {

	@Autowired
	private MyMenuRepository myMenuRepository ;
	
	@Override
	public List<MenuModel> menuAllList() {
		List<MenuEntity> menuEntity = myMenuRepository.menuAllList();
		List<MenuModel> menuModelList = new ArrayList<MenuModel>();
		for (MenuEntity menuListEntity : menuEntity) {
			MenuModel menuModel = new MenuModel();
			menuModel.setMenu_num(menuListEntity.getMenu_num());
			menuModel.setM_group(menuListEntity.getM_group());
			menuModel.setM_category(menuListEntity.getM_category());
			menuModel.setM_name(menuListEntity.getM_name());
			menuModel.setImage_name(menuListEntity.getImage());
			menuModel.setContent(menuListEntity.getContent());
			menuModel.setPrice(menuListEntity.getPrice());
			
			System.out.println("service_menuModel.getM_name : "+menuModel.getM_name());
			menuModelList.add(menuModel);
		}
		return menuModelList;
	}
	
	@Override
	public int register(MyMenuDomain mymenuDomain) {
		return myMenuRepository.register(mymenuDomain);
	}
	
	@Override
	public List<MyMenuModel> mymenuList() {
		return myMenuRepository.mymenuList();
	}

	@Override
	public int deleteMyMenu(int mymenu_num) {
		return myMenuRepository.deleteMyMenu(mymenu_num);
	}

	@Override
	public MyMenuModel findByMymenu(int mymenu_num) {
		return myMenuRepository.selectByMenu(mymenu_num);
	}

	@Override
	public int updateMyMenu(MyMenuDomain mymenuDomain) {
		return myMenuRepository.updateMyMenu(mymenuDomain) ;
	}

	

	
	



}
