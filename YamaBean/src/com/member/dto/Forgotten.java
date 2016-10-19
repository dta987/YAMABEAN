package com.member.dto;

public class Forgotten {

	private String id;
	private String email;
	private String name;

	@Override
	public String toString() {
		return "Forgotten [id=" + id + ", email=" + email + ", name=" + name
				+ "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
