package com.menu.mapper;

import java.util.List;

import com.menu.dto.Menu;


public interface MenuMapper {
	
	public int createMenu(Menu menu); // 메뉴추가

	public int updateMenu(Menu menu); // 메뉴수정
	
	public Menu selectByMenu(int pk); // 메뉴찾기
	
	public int deleteMember(int pk); // 메뉴추가, 삭제

	public List<Menu> selectList(String mode, String keyword); // 멤버리스트

}
