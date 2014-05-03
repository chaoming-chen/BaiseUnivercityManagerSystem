package com.ms.teach.by.pojo;

/**
 * @author zongwei
 */

public class UserPassword implements java.io.Serializable {

	private String userOldPassword;
	private String userNewPassword;

	public UserPassword() {
	}

	public UserPassword(String userOldPassword, String userNewPassword) {
		this.userOldPassword = userOldPassword;
		this.userNewPassword = userNewPassword;
	}

	public String getUserOldPassword() {
		return userOldPassword;
	}

	public void setUserOldPassword(String userOldPassword) {
		this.userOldPassword = userOldPassword;
	}

	public String getUserNewPassword() {
		return userNewPassword;
	}

	public void setUserNewPassword(String userNewPassword) {
		this.userNewPassword = userNewPassword;
	}


}