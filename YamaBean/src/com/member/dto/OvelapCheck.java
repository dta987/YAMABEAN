package com.member.dto;

public class OvelapCheck {

	private String keyword;
	private String mode;

	@Override
	public String toString() {
		return "overLapCheck [keyword=" + keyword + ", mode=" + mode + "]";
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
