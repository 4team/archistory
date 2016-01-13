package org.kkamnyang.domain;

import java.util.Date;

public class RouteVO {
	
	private Integer routeno;
	private Integer adminno;
	private String routename;
	private boolean secret; //null가능
	private boolean step;
	private String password; //null가능
	private double lat; //null가능
	private double lng; //null가능
	private Date regdate; //null가능
	private Date updatedate; //null가능	
	
	
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public Integer getAdminno() {
		return adminno;
	}
	public void setAdminno(Integer adminno) {
		this.adminno = adminno;
	}
	public boolean isStep() {
		return step;
	}
	public void setStep(boolean step) {
		this.step = step;
	}
	public Integer getRouteno() {
		return routeno;
	}
	public void setRouteno(Integer routeno) {
		this.routeno = routeno;
	}
	public String getRoutename() {
		return routename;
	}
	public void setRoutename(String routename) {
		this.routename = routename;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	
	@Override
	public String toString() {
		return "RouteVO [routeno=" + routeno + ", adminno=" + adminno + ", routename=" + routename + ", secret="
				+ secret + ", step=" + step + ", password=" + password + ", lat=" + lat + ", lng=" + lng + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
	
}
