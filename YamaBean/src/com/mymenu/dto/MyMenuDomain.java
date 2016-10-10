package com.mymenu.dto;

import com.member.dto.Member;
import com.menu.dto.MenuEntity;

public class MyMenuDomain {

	//view
	private int mymenu_num ;
	private Member member_id ; //fk, member : id 
	private String mymenu_name ;
	private MenuEntity menu ; //fk, menus : menu_num 
	private String my_option ; 
	private String sub_day ;
	
	public int getMymenu_num() {
		return mymenu_num;
	}
	public void setMymenu_num(int mymenu_num) {
		this.mymenu_num = mymenu_num;
	}
	public Member getMember_id() {
		return member_id;
	}
	public void setMember_id(Member member_id) {
		this.member_id = member_id;
	}
	public String getMymenu_name() {
		return mymenu_name;
	}
	public void setMymenu_name(String mymenu_name) {
		this.mymenu_name = mymenu_name;
	}
	public MenuEntity getMenu() {
		return menu;
	}
	public void setMenu(MenuEntity menu) {
		this.menu = menu;
	}
	public String getMy_option() {
		return my_option;
	}
	public void setMy_option(String my_option) {
		this.my_option = my_option;
	}
	public String getSub_day() {
		return sub_day;
	}
	public void setSub_day(String sub_day) {
		this.sub_day = sub_day;
	}
	
}
