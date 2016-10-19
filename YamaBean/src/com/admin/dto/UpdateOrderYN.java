package com.admin.dto;

public class UpdateOrderYN {

	private int num;
	private int val;
	private int store;

	@Override
	public String toString() {
		return "UpdateOrderYN [num=" + num + ", val=" + val + ", store="
				+ store + "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getVal() {
		return val;
	}

	public void setVal(int val) {
		this.val = val;
	}

	public int getStore() {
		return store;
	}

	public void setStore(int store) {
		this.store = store;
	}

}
