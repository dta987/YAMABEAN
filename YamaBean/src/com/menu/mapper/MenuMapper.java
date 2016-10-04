package com.menu.mapper;

import java.util.List;

import com.menu.dto.MenuEntity;

public interface MenuMapper {
	
	public int createMenu(MenuEntity menuEntity); // 메뉴추가

	public int updateMenu(MenuEntity menuEntity); // 메뉴수정
	
	public MenuEntity selectByMenu(int menu_num); // 메뉴 num 찾기
	
	public int deleteMenu(int menu_num); // 메뉴추가, 삭제

	/*public List<MenuEntity> selectList(String mode, String keyword); // 메뉴리스트 */
	public List<MenuEntity> selectList(); // 메뉴리스트
}
