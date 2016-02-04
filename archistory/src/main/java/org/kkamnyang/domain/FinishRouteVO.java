package org.kkamnyang.domain;

import java.util.Date;

public class FinishRouteVO {
	
	private java.lang.Integer participateno;
	private String routename;
	private java.lang.String username;
	private Integer routeno;
	private Integer memberno;
	private java.lang.Integer score;
	private Date participatedate;
	private Date lastdate;
	
	public java.lang.Integer getParticipateno() {
		return participateno;
	}
	public void setParticipateno(java.lang.Integer participateno) {
		this.participateno = participateno;
	}
	public String getRoutename() {
		return routename;
	}
	public void setRoutename(String routename) {
		this.routename = routename;
	}
	public java.lang.String getUsername() {
		return username;
	}
	public void setUsername(java.lang.String username) {
		this.username = username;
	}
	public Integer getRouteno() {
		return routeno;
	}
	public void setRouteno(Integer routeno) {
		this.routeno = routeno;
	}
	public Integer getMemberno() {
		return memberno;
	}
	public void setMemberno(Integer memberno) {
		this.memberno = memberno;
	}
	public java.lang.Integer getScore() {
		return score;
	}
	public void setScore(java.lang.Integer score) {
		this.score = score;
	}
	public Date getParticipatedate() {
		return participatedate;
	}
	public void setParticipatedate(Date participatedate) {
		this.participatedate = participatedate;
	}
	public Date getLastdate() {
		return lastdate;
	}
	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}
	
	@Override
	public String toString() {
		return "FinishRouteVO [participateno=" + participateno + ", routename=" + routename + ", username=" + username
				+ ", routeno=" + routeno + ", memberno=" + memberno + ", score=" + score + ", participatedate="
				+ participatedate + ", lastdate=" + lastdate + "]";
	}
	
	
}
