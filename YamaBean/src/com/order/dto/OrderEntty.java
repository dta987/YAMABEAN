package com.order.dto;

public class OrderEntty {

	private int order_num;
	private String member_id;
	private String m_group;
	private String pickup;
	private String address;
	private int store_num;
	private int total_price;
	private String payment;
	private String order_etc;

	@Override
	public String toString() {
		return "OrderEntty [order_num=" + order_num + ", member_id="
				+ member_id + ", m_group=" + m_group + ", pickup=" + pickup
				+ ", address=" + address + ", store_num=" + store_num
				+ ", total_price=" + total_price + ", payment=" + payment
				+ ", order_etc=" + order_etc + "]";
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getM_group() {
		return m_group;
	}

	public void setM_group(String m_group) {
		this.m_group = m_group;
	}

	public String getPickup() {
		return pickup;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStore_num() {
		return store_num;
	}

	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getOrder_etc() {
		return order_etc;
	}

	public void setOrder_etc(String order_etc) {
		this.order_etc = order_etc;
	}

}
