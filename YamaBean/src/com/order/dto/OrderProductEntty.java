package com.order.dto;

import java.util.Arrays;

public class OrderProductEntty {

	private int order_p_num;
	private int menu_num;
	private int order_num;
	private int order_p_qty;
	private int order_p_price;
	private String order_p_group;
	private String optionsize;
	private int optionshot;
	private int optionwhip;

	@Override
	public String toString() {
		return "OrderProductEntty [order_p_num=" + order_p_num + ", menu_num="
				+ menu_num + ", order_num=" + order_num + ", order_p_qty="
				+ order_p_qty + ", order_p_price=" + order_p_price
				+ ", order_p_group=" + order_p_group + ", optionsize="
				+ optionsize + ", optionshot=" + optionshot + ", optionwhip="
				+ optionwhip + "]";
	}

	public int getOrder_p_num() {
		return order_p_num;
	}

	public void setOrder_p_num(int order_p_num) {
		this.order_p_num = order_p_num;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getOrder_p_qty() {
		return order_p_qty;
	}

	public void setOrder_p_qty(int order_p_qty) {
		this.order_p_qty = order_p_qty;
	}

	public int getOrder_p_price() {
		return order_p_price;
	}

	public void setOrder_p_price(int order_p_price) {
		this.order_p_price = order_p_price;
	}

	public String getOrder_p_group() {
		return order_p_group;
	}

	public void setOrder_p_group(String order_p_group) {
		this.order_p_group = order_p_group;
	}

	public String getOptionsize() {
		return optionsize;
	}

	public void setOptionsize(String optionsize) {
		this.optionsize = optionsize;
	}

	public int getOptionshot() {
		return optionshot;
	}

	public void setOptionshot(int optionshot) {
		this.optionshot = optionshot;
	}

	public int getOptionwhip() {
		return optionwhip;
	}

	public void setOptionwhip(int optionwhip) {
		this.optionwhip = optionwhip;
	}

}
