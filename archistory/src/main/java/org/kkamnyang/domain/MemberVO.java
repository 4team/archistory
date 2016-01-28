package org.kkamnyang.domain;

import java.util.Date;

public class MemberVO {
	
	private Integer memberno;
	private Integer userNo;
	private String userName;
	private String email;
	private String mPassword;
	private String img;
	private Date regdate;
	public Integer getMemberno() {
		return memberno;
	}
	public void setMemberno(Integer memberno) {
		this.memberno = memberno;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [memberno=" + memberno + ", userNo=" + userNo + ", userName=" + userName + ", email=" + email
				+ ", mPassword=" + mPassword + ", img=" + img + ", regdate=" + regdate + "]";
	}
	
	

	
}
