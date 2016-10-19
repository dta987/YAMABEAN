package com.admin.dto;

import com.menu.dto.MenuEntity;

public class BestMenuModel {

	private int menu_num;
	private MenuEntity menu;
	private int qty;

	@Override
	public String toString() {
		return "BestMenuModel [menu_num=" + menu_num + ", menu=" + menu
				+ ", qty=" + qty + "]";
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public MenuEntity getMenu() {
		return menu;
	}

	public void setMenu(MenuEntity menu) {
		this.menu = menu;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

}
