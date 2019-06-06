package com.hobby.pojo;

import java.util.Date;

public class User {

	private String activecode;//激活码
	private int emaillive; //1表示已激活账户
	private String email;
	private Date birthday;
	private String uid;
	private String username;
	private String password;
	private String images;
	private int status;  //1表示
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getEmaillive() {
		return emaillive;
	}
	public void setEmaillive(int emaillive) {
		this.emaillive = emaillive;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getActivecode() {
		return activecode;
	}
	public void setActivecode(String activecode) {
		this.activecode = activecode;
	}
	@Override
	public String toString() {
		return "User [activecode=" + activecode + ", emaillive=" + emaillive + ", email=" + email + ", birthday="
				+ birthday + ", uid=" + uid + ", username=" + username + ", password=" + password + ", images=" + images
				+ ", status=" + status + "]";
	}

	
}
