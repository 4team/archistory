package org.kkamnyang.domain;

import java.util.Date;

public class ParticipateVO {
	private java.lang.Integer participateno;
	private java.lang.Integer routeno;
	private java.lang.Integer memberno;
	private java.lang.Integer score;
	private Date participatedate;
	private Date lastdate;
	private java.lang.Integer stage;
	private java.lang.Boolean finish;
	
	
	public java.lang.Integer getParticipateno() {
		return participateno;
	}
	public void setParticipateno(java.lang.Integer participateno) {
		this.participateno = participateno;
	}
	public java.lang.Integer getRouteno() {
		return routeno;
	}
	public void setRouteno(java.lang.Integer routeno) {
		this.routeno = routeno;
	}
	public java.lang.Integer getMemberno() {
		return memberno;
	}
	public void setMemberno(java.lang.Integer memberno) {
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
	public java.lang.Integer getStage() {
		return stage;
	}
	public void setStage(java.lang.Integer stage) {
		this.stage = stage;
	}
	public java.lang.Boolean getFinish() {
		return finish;
	}
	public void setFinish(java.lang.Boolean finish) {
		this.finish = finish;
	}
	
	@Override
	public String toString() {
		return "ParticipateVO [participateno=" + participateno + ", routeno=" + routeno + ", memberno=" + memberno
				+ ", score=" + score + ", participatedate=" + participatedate + ", stage=" + stage + ", finish="
				+ finish + "]";
	}
	
}
