package com.trungtamjava.model;

public class SearchUser extends SearchDTO{
	private int role = 1;

	public SearchUser() {
		super();
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
}
