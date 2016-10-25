package com.order.dto;

import java.util.Arrays;

public class OrderDomin {
	private String member_id;
	private int[] m_num;
	private int[] ordervalue;
	private String[] m_name;
	private String m_group;
	private int totalprice;
	private int store_num;
	private int usepoint;
	private String payment;
	private String[] optionsize;
	private int[] optionshot;
	private int[] optionwhip;

	@Override
	public String toString() {
		return "OrderDomin [member_id=" + member_id + ", m_num="
				+ Arrays.toString(m_num) + ", ordervalue="
				+ Arrays.toString(ordervalue) + ", m_name="
				+ Arrays.toString(m_name) + ", m_group=" + m_group
				+ ", totalprice=" + totalprice + ", store_num=" + store_num
				+ ", usepoint=" + usepoint + ", payment=" + payment
				+ ", optionsize=" + Arrays.toString(optionsize)
				+ ", optionshot=" + Arrays.toString(optionshot)
				+ ", optionwhip=" + Arrays.toString(optionwhip) + "]";
	}

	public String getMember_id() {
		return member_id;
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

	public String[] getM_name() {
		return m_name;
	}

	public void setM_name(String[] m_name) {
		this.m_name = m_name;
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

	public String[] getOptionsize() {
		return optionsize;
	}

	public void setOptionsize(String[] optionsize) {
		this.optionsize = optionsize;
	}

	public int[] getOptionshot() {
		return optionshot;
	}

	public void setOptionshot(int[] optionshot) {
		this.optionshot = optionshot;
	}

	public int[] getOptionwhip() {
		return optionwhip;
	}

	public void setOptionwhip(int[] optionwhip) {
		this.optionwhip = optionwhip;
	}

}
