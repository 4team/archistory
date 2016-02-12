package org.kkamnyang.domain;

import java.sql.Date;

public class AdminVO {

	private java.lang.Integer adminno;
	private java.lang.String email;
	private java.lang.String password;
	private java.lang.String username;
	private java.lang.Integer phone;
	private java.lang.String nation;
	private java.lang.String img;
	private Date joindate;
	private boolean enabled;
	private String enablekey;
	
	
	public java.lang.Integer getAdminno() {
		return adminno;
	}
	public void setAdminno(java.lang.Integer adminno) {
		this.adminno = adminno;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		this.email = email;
	}
	public java.lang.String getPassword() {
		return password;
	}
	public void setPassword(java.lang.String password) {
		this.password = password;
	}
	public java.lang.String getUsername() {
		return username;
	}
	public void setUsername(java.lang.String username) {
		this.username = username;
	}
	public java.lang.Integer getPhone() {
		return phone;
	}
	public void setPhone(java.lang.Integer phone) {
		this.phone = phone;
	}
	public java.lang.String getNation() {
		return nation;
	}
	public void setNation(java.lang.String nation) {
		this.nation = nation;
	}
	public java.lang.String getImg() {
		return img;
	}
	public void setImg(java.lang.String img) {
		this.img = img;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getEnablekey() {
		return enablekey;
	}
	public void setEnablekey(String enablekey) {
		this.enablekey = enablekey;
	}
	
	@Override
	public String toString() {
		return "AdminVO [adminno=" + adminno + ", email=" + email + ", password=" + password + ", username=" + username
				+ ", phone=" + phone + ", nation=" + nation + ", img=" + img + ", joindate=" + joindate + ", enabled="
				+ enabled + ", enablekey=" + enablekey + "]";
	}

}
