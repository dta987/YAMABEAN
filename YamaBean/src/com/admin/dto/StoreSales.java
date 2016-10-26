package com.admin.dto;

public class StoreSales {

	private int totalprice;
	private int store_num;
	private String store_name;

	@Override
	public String toString() {
		return "StoreSales [totalprice=" + totalprice + ", store_num="
				+ store_num + ", store_name=" + store_name + "]";
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

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

}
