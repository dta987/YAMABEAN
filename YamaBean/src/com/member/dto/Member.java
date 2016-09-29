package com.member.dto;

public class Member {

	private int member_num;
	private String id;
	private String password;
	private String address_num;
	private String address_1;
	private String address_2;
	private String birthday;
	private String phone;
	private String nickname;
	private String gender;

	@Override
	public String toString() {
		return "Member [member_num=" + member_num + ", id=" + id
				+ ", password=" + password + ", address_num=" + address_num
				+ ", address_1=" + address_1 + ", address_2=" + address_2
				+ ", birthday=" + birthday + ", phone=" + phone + ", nickname="
				+ nickname + ", gender=" + gender + "]";
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress_num() {
		return address_num;
	}

	public void setAddress_num(String address_num) {
		this.address_num = address_num;
	}

	public String getAddress_1() {
		return address_1;
	}

	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}

	public String getAddress_2() {
		return address_2;
	}

	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
