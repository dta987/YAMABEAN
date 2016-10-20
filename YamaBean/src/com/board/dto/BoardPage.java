package com.board.dto;

import org.apache.ibatis.session.RowBounds;

public class BoardPage {

	private int selectPage = 1;
	private String mode = null;
	private String keyword = null;
	private RowBounds rowBounds;

	public RowBounds getRowBounds() {
		return rowBounds;
	}

	public void setRowBounds(RowBounds rowBounds) {
		this.rowBounds = rowBounds;
	}

	@Override
	public String toString() {
		return "BoardPage [selectPage=" + selectPage + ", mode=" + mode
				+ ", keyword=" + keyword + ", rowBounds=" + rowBounds + "]";
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
