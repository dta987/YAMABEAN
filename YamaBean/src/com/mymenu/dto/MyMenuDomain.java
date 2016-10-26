package com.mymenu.dto;

public class MyMenuDomain {

	// view
	private int mymenu_num;
	private String member_id; // fk, member : id
	private String mymenu_name;
	private int menu_num; // fk, menus : menu_num
	private String my_optionSize;
	private String sub_day;
	private int mymenu_price;
	private int my_optionShot;
	private int my_optionWhip;

	@Override
	public String toString() {
		return "MyMenuDomain [mymenu_num=" + mymenu_num + ", member_id="
				+ member_id + ", mymenu_name=" + mymenu_name + ", menu_num="
				+ menu_num + ", my_optionSize=" + my_optionSize + ", sub_day="
				+ sub_day + ", mymenu_price=" + mymenu_price
				+ ", my_optionShot=" + my_optionShot + ", my_optionWhip="
				+ my_optionWhip + "]";
	}

	public int getMymenu_num() {
		return mymenu_num;
	}

	public void setMymenu_num(int mymenu_num) {
		this.mymenu_num = mymenu_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMymenu_name() {
		return mymenu_name;
	}

	public void setMymenu_name(String mymenu_name) {
		this.mymenu_name = mymenu_name;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public String getMy_optionSize() {
		return my_optionSize;
	}

	public void setMy_optionSize(String my_optionSize) {
		this.my_optionSize = my_optionSize;
	}

	public String getSub_day() {
		return sub_day;
	}

	public void setSub_day(String sub_day) {
		this.sub_day = sub_day;
	}

	public int getMymenu_price() {
		return mymenu_price;
	}

	public void setMymenu_price(int mymenu_price) {
		this.mymenu_price = mymenu_price;
	}

	public int getMy_optionShot() {
		return my_optionShot;
	}

	public void setMy_optionShot(int my_optionShot) {
		this.my_optionShot = my_optionShot;
	}

	public int getMy_optionWhip() {
		return my_optionWhip;
	}

	public void setMy_optionWhip(int my_optionWhip) {
		this.my_optionWhip = my_optionWhip;
	}

}
