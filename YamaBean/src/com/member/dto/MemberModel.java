package com.member.dto;

public class MemberModel {

	private String id;
	private String password;
	private String name;
	private String gender;
	private String phone;
	private String nickname;
	private String zipcode;
	private String address;
	private String bday;
	private String first_email;
	private String last_email;

	@Override
	public String toString() {
		return "MemberModel [id=" + id + ", password=" + password + ", name="
				+ name + ", gender=" + gender + ", phone=" + phone
				+ ", nickname=" + nickname + ", zipcode=" + zipcode
				+ ", address=" + address + ", bday=" + bday + ", first_email="
				+ first_email + ", last_email=" + last_email + "]";
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	public String getFirst_email() {
		return first_email;
	}

	public void setFirst_email(String first_email) {
		this.first_email = first_email;
	}

	public String getLast_email() {
		return last_email;
	}

	public void setLast_email(String last_email) {
		this.last_email = last_email;
	}

}
