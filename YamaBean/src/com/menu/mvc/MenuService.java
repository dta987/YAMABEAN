package com.menu.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.menu.dto.FileUtile;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuDomain;
import com.menu.dto.MenuModel;

@Service
public class MenuService implements MuServiceInterface {

	@Autowired
	private MenuRepository menuRepository ;
	
	
	@Override
	public int addMenu(MenuDomain menuDomain) {
		System.out.println("addMenuService");
		
		/*	��ü ���� ( ���� ������ ������ FileUtil.class ���� )
	 	1. ���� ������ ����� ������ ���� �̸� ���� 
		2. ���� ������ ���� ����
		3. DB�� ������ ��ƼƼ ����				*/
		
		String saveFileName = FileUtile.makeSavedFileName(menuDomain.getImage().getOriginalFilename()) ;
		System.out.println(saveFileName.toString());
		
		boolean uploadResult = false; 
		try {
			uploadResult = FileUtile.saveFile(saveFileName, menuDomain.getImage().getBytes());
		} catch (IOException e) {
			System.out.println("--���Ͼ��ε����--");
			e.printStackTrace();
		}		
		System.out.println("uploadResult : "+uploadResult);
		
		MenuEntity menuEntity = null ;
		if (uploadResult) {
			menuEntity = new MenuEntity();
			menuEntity.setM_group(menuDomain.getM_group());
			menuEntity.setM_category(menuDomain.getM_category());
			menuEntity.setImage(menuDomain.getImage().getOriginalFilename());
			menuEntity.setContent(menuDomain.getContent());
			menuEntity.setPrice(menuDomain.getPrice());
		}
		
		System.out.println("menuEntity.getContent : " +menuEntity.getContent());
		
		return menuRepository.createMenu(menuEntity);
	}

	
	@Override
	public List<MenuModel> findByList() {
		List<MenuEntity> menuEntity = menuRepository.selectList();
		List<MenuModel> menuModelList = new ArrayList<MenuModel>();
		for (MenuEntity menuListEntity : menuEntity) {
			MenuModel menuModel = new MenuModel();
			menuModel.setMenu_num(menuListEntity.getMenu_num());
			menuModel.setM_group(menuListEntity.getM_group());
			menuModel.setM_category(menuListEntity.getM_category());
			menuModel.setImage_name(menuListEntity.getImage());
			menuModel.setContent(menuListEntity.getContent());
			menuModel.setPrice(menuListEntity.getPrice());
			
			System.out.println("menuModel.getContent() : "+menuModel.getContent());
			menuModelList.add(menuModel);
		}
		return menuModelList;
	}
	
	@Override
	public boolean removeMenu(int menu_num) {
		MenuEntity menuEntity = menuRepository.selectByMenu(menu_num) ;
		int cnt = menuRepository.deleteMenu(menu_num) ;
		if (cnt>0) {
			FileUtile.deleteFile(menuEntity.getImage());
			return true;
		}
		return false;
	}

	@Override
	public MenuDomain findByMenu(int menu_num) {
		MenuEntity menuEntity = menuRepository.selectByMenu(menu_num);
		MenuDomain menuDomain = new MenuDomain();
		if (menuEntity != null ) {
			/*FileUtile.deleteFile(menuEntity.getImage());*/
			
			menuDomain.setM_group(menuEntity.getM_group());
			menuDomain.setM_category(menuEntity.getM_category());
			menuDomain.setContent(menuEntity.getContent());
			menuDomain.setPrice(menuEntity.getPrice());	
		}else {
			System.out.println("--�������� ���� �̹������� ���� ����--");		
		}	
		return menuDomain;
		
	}
	@Override
	public int modifyMenu(MenuDomain menuDomain) {
		String saveFileName = FileUtile.makeSavedFileName(menuDomain.getImage().getOriginalFilename()) ;
		System.out.println(saveFileName.toString());
		
		boolean uploadResult = false; 
		try {
			uploadResult = FileUtile.saveFile(saveFileName, menuDomain.getImage().getBytes());
		} catch (IOException e) {
			System.out.println("--���Ͼ��ε����--");
			e.printStackTrace();
		}		
		System.out.println("uploadResult : "+uploadResult);
		
		MenuEntity menuEntity = null ;
		if (uploadResult) {
			menuEntity = new MenuEntity();
			menuEntity.setM_group(menuDomain.getM_group());
			menuEntity.setM_category(menuDomain.getM_category());
			menuEntity.setImage(menuDomain.getImage().getOriginalFilename());
			menuEntity.setContent(menuDomain.getContent());
			menuEntity.setPrice(menuDomain.getPrice());
		}
		
		System.out.println("menuEntity.getContent : " +menuEntity.getContent());
		
		return menuRepository.updateMenu(menuEntity);
	}
	
	

}
