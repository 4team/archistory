package org.kkamnyang.domain;

public class InviteVO {

	private Integer inviteno;
	private Integer routeno;
	private Integer memberno;
	
	public Integer getInviteno() {
		return inviteno;
	}
	public void setInviteno(Integer inviteno) {
		this.inviteno = inviteno;
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
	@Override
	public String toString() {
		return "InviteVO [inviteno=" + inviteno + ", routeno=" + routeno + ", memberno=" + memberno + "]";
	}
	
	
	
}
