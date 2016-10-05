package com.menu.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		System.out.println("service_addMenuSaveFileName : " +saveFileName.toString());
		
		boolean uploadResult = false; 
		try {
			uploadResult = FileUtile.saveFile(saveFileName, menuDomain.getImage().getBytes());
		} catch (IOException e) {
			System.out.println("--service_addMenu���Ͼ��ε����--");
			e.printStackTrace();
		}		
		System.out.println("service_addMenuUploadResult : "+uploadResult);
		
		MenuEntity menuEntity = null ;
		if (uploadResult) {
			menuEntity = new MenuEntity();
			menuEntity.setMenu_num(menuDomain.getMenu_num());
			menuEntity.setM_group(menuDomain.getM_group());
			menuEntity.setM_category(menuDomain.getM_category());
			menuEntity.setM_name(menuDomain.getM_name());
			menuEntity.setImage(saveFileName);
			menuEntity.setContent(menuDomain.getContent());
			menuEntity.setPrice(menuDomain.getPrice());
		}
		
		System.out.println("service_addMenuMenuEntity.getM_name : " +menuEntity.getM_name());
		
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
			menuDomain.setMenu_num(menuEntity.getMenu_num());
			menuDomain.setM_group(menuEntity.getM_group());
			menuDomain.setM_category(menuEntity.getM_category());
			menuDomain.setM_name(menuEntity.getM_name());
			menuDomain.setContent(menuEntity.getContent());
			menuDomain.setPrice(menuEntity.getPrice());
			
			System.out.println("--service_���� : ���� ���� �������� ����--");
			
			/*FileUtile.deleteFile(menuEntity.getImage());
			System.out.println("--���� : �������� ���� �̹������� ���� ����--");*/
		}else {
			System.out.println("--service_���� : ���� ���� �������� ����--");		
		}	
		return menuDomain;
		
	}
	@Override
	public int modifyMenu(MenuDomain menuDomain) {
		String saveFileName = FileUtile.makeSavedFileName(menuDomain.getImage().getOriginalFilename()) ;
		System.out.println("service_modifyMenuSaveFileName" +saveFileName.toString());
		
		boolean uploadResult = false; 
		try {
			uploadResult = FileUtile.saveFile(saveFileName, menuDomain.getImage().getBytes());
		} catch (IOException e) {
			System.out.println("--service_���Ͼ��ε����--");
			e.printStackTrace();
		}		
		System.out.println("uploadResult : "+uploadResult);
		
		MenuEntity menuEntity = null ;
		if (uploadResult) {
			menuEntity = new MenuEntity();
			menuEntity.setMenu_num(menuDomain.getMenu_num());
			menuEntity.setM_group(menuDomain.getM_group());
			menuEntity.setM_category(menuDomain.getM_category());
			menuEntity.setM_name(menuDomain.getM_name()); 
			menuEntity.setImage(saveFileName);
			menuEntity.setContent(menuDomain.getContent());
			menuEntity.setPrice(menuDomain.getPrice());
		}
		
		System.out.println("menuEntity.getContent : " +menuEntity.getContent());
		
		return menuRepository.updateMenu(menuEntity);
	}


	@Override
	public MenuModel detailManeu(int menu_num) {
		MenuEntity menuEntity = menuRepository.selectByMenu(menu_num);
		MenuModel menuModel = new MenuModel();
		if (menuEntity != null) {
			menuModel.setMenu_num(menuEntity.getMenu_num());
			menuModel.setM_group(menuEntity.getM_group());
			menuModel.setM_category(menuEntity.getM_category());
			menuModel.setImage_name(menuEntity.getImage());
			menuModel.setContent(menuEntity.getContent());
			menuModel.setPrice(menuEntity.getPrice());
			menuModel.setM_name(menuEntity.getM_name());
			
			System.out.println("--service_ menu_num :" + menu_num + " / " + "DB���� ������ menu_num��  " + menuEntity.getMenu_num() + " --");
		}
		return menuModel;
	}


	

}
