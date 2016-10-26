package com.admin.dto;

public class StoreOrdercondition {

	private int selectPage = 1;
	private int store_num;
	private String keyword = null;
	private String mode = null;

	@Override
	public String toString() {
		return "StoreOrdercondition [selectPage=" + selectPage + ", store_num="
				+ store_num + ", keyword=" + keyword + ", mode=" + mode + "]";
	}

	public int getSelectPage() {
		return selectPage;
	}

	public void setSelectPage(int selectPage) {
		this.selectPage = selectPage;
	}

	public int getStore_num() {
		return store_num;
	}

	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

}
