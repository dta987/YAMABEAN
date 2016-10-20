package com.board.dto;

public class Board {

	private int board_num;
	private String b_category;
	private String title;
	private String sub_day;
	private String member_id;
	private String contents;
	private int group_no;
	private int order_no;

	@Override
	public String toString() {
		return "Board [board_num=" + board_num + ", b_category=" + b_category
				+ ", title=" + title + ", sub_day=" + sub_day + ", member_id="
				+ member_id + ", contents=" + contents + ", group_no="
				+ group_no + ", order_no=" + order_no + "]";
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSub_day() {
		return sub_day;
	}

	public void setSub_day(String sub_day) {
		this.sub_day = sub_day;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

}
