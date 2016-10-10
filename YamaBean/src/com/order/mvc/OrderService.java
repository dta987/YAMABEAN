package com.order.mvc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;

@Service
public class OrderService {

	@Autowired
	private OrderRepository repository;

	public List<MenuModel> findByList() {
		List<MenuEntity> menuEntity = repository.selectList();
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

			System.out.println("service_menuModel.getM_name : "
					+ menuModel.getM_name());
			menuModelList.add(menuModel);
		}
		return menuModelList;
	}

}
