package com.admin.dto;

import java.util.List;

import com.member.dto.Member;
import com.order.dto.OrderProductEntty;

public class OrderList {

	private int order_num;
	private Member member;
	private List<?> orderProduct;
	private int totalprice;
	private int store_num;
	
	@Override
	public String toString() {
		return "OrderList [order_num=" + order_num + ", member=" + member
				+ ", orderProduct=" + orderProduct + ", totalprice="
				+ totalprice + ", store_num=" + store_num + "]";
	}

	public int getOrder_num() {
		return order_num;
	}

	public int getStore_num() {
		return store_num;
	}

	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<?> getOrderProduct() {
		return orderProduct;
	}

	public void setOrderProduct(List<?> orderProduct) {
		this.orderProduct = orderProduct;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

}
