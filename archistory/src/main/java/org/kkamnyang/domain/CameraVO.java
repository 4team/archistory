package org.kkamnyang.domain;

import java.util.Date;

public class CameraVO {
	private java.lang.Integer camerano;
	private java.lang.Integer eventno;
	private java.lang.Integer memberno;
	private java.lang.Integer participateno;
	private java.lang.String filename;
	private Date regdate;
	
	public java.lang.Integer getCamerano() {
		return camerano;
	}
	public void setCamerano(java.lang.Integer camerano) {
		this.camerano = camerano;
	}
	public java.lang.Integer getEventno() {
		return eventno;
	}
	public void setEventno(java.lang.Integer eventno) {
		this.eventno = eventno;
	}
	public java.lang.Integer getMemberno() {
		return memberno;
	}
	public void setMemberno(java.lang.Integer memberno) {
		this.memberno = memberno;
	}
	public java.lang.Integer getParticipateno() {
		return participateno;
	}
	public void setParticipateno(java.lang.Integer participateno) {
		this.participateno = participateno;
	}
	public java.lang.String getFilename() {
		return filename;
	}
	public void setFilename(java.lang.String filename) {
		this.filename = filename;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "CameraVO [camerano=" + camerano + ", eventno=" + eventno + ", memberno=" + memberno + ", participateno="
				+ participateno + ", filename=" + filename + ", regdate=" + regdate + "]";
	}
	
}
