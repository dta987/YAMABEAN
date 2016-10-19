package com.order.dto;

import com.storeMap.dto.Store;

public class OrderCheckModel {

	private String member_id;
	private int usePoint;
	private int addPoint;
	private int point;
	private int totalprice;
	private Store store;
	private String payment;

	@Override
	public String toString() {
		return "OrderCheckModel [member_id=" + member_id + ", usePoint="
				+ usePoint + ", addPoint=" + addPoint + ", point=" + point
				+ ", totalprice=" + totalprice + ", store=" + store
				+ ", payment=" + payment + "]";
	}

	public String getMember_id() {
		return member_id;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getAddPoint() {
		return addPoint;
	}

	public void setAddPoint(int addPoint) {
		this.addPoint = addPoint;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

}
