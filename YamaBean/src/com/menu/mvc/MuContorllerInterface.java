package com.menu.mvc;

import org.springframework.ui.Model;

import com.member.dto.Member;
import com.menu.dto.Menu;

public interface MuContorllerInterface {

	public String createMenu(Menu menu); // 메뉴추가

	public String alertMenu(Menu menu, Model model); // 메뉴수정
	
	public String searchMenu(int pk); // 메뉴찾기
	
	public String deleteMember(int pk); // 메뉴추가, 삭제

	public String menuList(String mode, String keyword, Model model); // 멤버리스트
	
}
