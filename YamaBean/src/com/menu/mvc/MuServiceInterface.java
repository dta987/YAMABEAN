package com.menu.mvc;

import java.util.List;

import com.menu.dto.MenuDomain;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;

public interface MuServiceInterface {
	
	public int addMenu(MenuDomain menuDomain); // �޴��߰�

	
	/*public int removeMenu(int pk); // �޴����� */
	public boolean removeMenu(int menu_num); // �޴�����
	
	/*public List<MenuEntity> findByList(String mode, String keyword); // �޴�����Ʈ */
	public List<MenuModel> findByList();
	
	
	public int modifyMenu(MenuDomain menuDomain); // �޴�����
	
	public MenuDomain findByMenu(int menu_num); // �޴�ã��
	
	

}
