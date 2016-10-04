package com.menu.mvc;

import java.util.List;

import com.menu.dto.MenuDomain;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;

public interface MuServiceInterface {
	
	public int addMenu(MenuDomain menuDomain); // 메뉴추가

	
	/*public int removeMenu(int pk); // 메뉴삭제 */
	public boolean removeMenu(int menu_num); // 메뉴삭제
	
	/*public List<MenuEntity> findByList(String mode, String keyword); // 메뉴리스트 */
	public List<MenuModel> findByList();
	
	
	public int modifyMenu(MenuDomain menuDomain); // 메뉴수정
	
	public MenuDomain findByMenu(int menu_num); // 메뉴찾기
	
	

}
