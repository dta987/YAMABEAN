package com.storeMap.dto;

public class Store {

	private int store_num;
	private String store_name;
	private String store_phone;
	private String store_address;

	@Override
	public String toString() {
		return "store [store_num=" + store_num + ", store_name=" + store_name
				+ ", store_phone=" + store_phone + ", store_address="
				+ store_address + "]";
	}

	public int getStore_num() {
		return store_num;
	}

	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_phone() {
		return store_phone;
	}

	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}

	public String getStore_address() {
		return store_address;
	}

	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}

}
