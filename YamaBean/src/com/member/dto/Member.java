package com.member.dto;

public class Member {

	private String id;
	private String password;
	private String name;
	private String gender;
	private String phone;
	private String nickname;
	private String zipcode;
	private String address;
	private String bday;
	private String email;
	private String joinday;
	private int point;

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", phone=" + phone + ", nickname="
				+ nickname + ", zipcode=" + zipcode + ", address=" + address
				+ ", bday=" + bday + ", email=" + email + ", joinday="
				+ joinday + ", point=" + point + "]";
	}

	public String getId() {	
		return id;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBday() {
		return bday;
	}

	public void setBday(String bday) {
		this.bday = bday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoinday() {
		return joinday;
	}

	public void setJoinday(String joinday) {
		this.joinday = joinday;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}
