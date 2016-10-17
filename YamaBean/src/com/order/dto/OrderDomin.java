package com.order.dto;

import java.util.Arrays;

public class OrderDomin {
	private String member_id;
	private int[] m_num;
	private int[] ordervalue;
	private String m_group;
	private int totalprice;
	private int store_num;
	private int usepoint;
	private String payment;
	private String pickup;

	@Override
	public String toString() {
		return "OrderDomin [member_id=" + member_id + ", m_num="
				+ Arrays.toString(m_num) + ", ordervalue="
				+ Arrays.toString(ordervalue) + ", m_group=" + m_group
				+ ", totalprice=" + totalprice + ", store_num=" + store_num
				+ ", usepoint=" + usepoint + ", payment=" + payment
				+ ", pickup=" + pickup + "]";
	}

	public String getMember_id() {
		return member_id;
	}

	public String getPickup() {
		return pickup;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int[] getM_num() {
		return m_num;
	}

	public void setM_num(int[] m_num) {
		this.m_num = m_num;
	}

	public int[] getOrdervalue() {
		return ordervalue;
	}

	public void setOrdervalue(int[] ordervalue) {
		this.ordervalue = ordervalue;
	}

	public String getM_group() {
		return m_group;
	}

	public void setM_group(String m_group) {
		this.m_group = m_group;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getStore_num() {
		return store_num;
	}

	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}

	public int getUsepoint() {
		return usepoint;
	}

	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

}
