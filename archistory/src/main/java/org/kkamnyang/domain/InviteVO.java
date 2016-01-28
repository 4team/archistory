package org.kkamnyang.domain;

public class InviteVO {

	private Integer inviteNo;
	private Integer routeNo;
	private Integer memberNo;
	
	public Integer getInviteNo() {
		return inviteNo;
	}
	public void setInviteNo(Integer inviteNo) {
		this.inviteNo = inviteNo;
	}
	public Integer getRouteNo() {
		return routeNo;
	}
	public void setRouteNo(Integer routeNo) {
		this.routeNo = routeNo;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "InviteVO [inviteNo=" + inviteNo + ", routeNo=" + routeNo + ", memberNo=" + memberNo + "]";
	}
	
	
}
