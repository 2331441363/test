package com.lijie.entity;

public class Users {
	/**
	 * ”√ªß√˚
	 */
	private String userId;
	/**
	 * √‹¬Î
	 */
	private String userPassword;

	private String userSex;
	
	private String userPhone;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Users() {
		super();
	}

	public Users(String userId, String userPassword, String userSex, String userPhone) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userSex = userSex;
		this.userPhone = userPhone;
	}
	
	
}
