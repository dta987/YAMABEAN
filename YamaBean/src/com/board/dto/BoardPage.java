package com.board.dto;


public class BoardPage {

	private int selectPage = 1;
	private String mode = null;
	private String keyword = null;

	@Override
	public String toString() {
		return "BoardPage [selectPage=" + selectPage + ", mode=" + mode
				+ ", keyword=" + keyword + "]";
	}

	public int getSelectPage() {
		return selectPage;
	}

	public void setSelectPage(int selectPage) {
		this.selectPage = selectPage;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
