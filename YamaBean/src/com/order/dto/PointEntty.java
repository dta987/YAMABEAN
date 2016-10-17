package com.order.dto;

public class PointEntty {

	private String member_id;
	private int Point;

	@Override
	public String toString() {
		return "PointEntty [member_id=" + member_id + ", Point=" + Point + "]";
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPoint() {
		return Point;
	}

	public void setPoint(int point) {
		Point = point;
	}

}
