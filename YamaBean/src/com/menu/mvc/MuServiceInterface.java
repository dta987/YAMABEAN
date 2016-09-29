package com.menu.mvc;

import java.util.List;

import com.menu.dto.Menu;

public interface MuServiceInterface {
	
	public int addMenu(Menu menu); // 메뉴추가

	public int modifMenu(Menu menu); // 메뉴수정
	
	public Menu findByMenu(int pk); // 메뉴찾기
	
	public int removeMember(int pk); // 메뉴추가, 삭제

	public List<Menu> findByList(String mode, String keyword); // 멤버리스트
	

}
