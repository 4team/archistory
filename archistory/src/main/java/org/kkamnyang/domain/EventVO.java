package org.kkamnyang.domain;

public class EventVO {
	
	private Integer eventno;
	private Integer routeno;
	private String title;
	private String content; //null가능
	private double lat;
	private double lng;
	private boolean camera; //null가능
	private Integer eorder; //null가능
	private String efiles;
	
	
	
	public Integer getEventno() {
		return eventno;
	}



	public void setEventno(Integer eventno) {
		this.eventno = eventno;
	}



	public Integer getRouteno() {
		return routeno;
	}



	public void setRouteno(Integer routeno) {
		this.routeno = routeno;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
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



	public boolean isCamera() {
		return camera;
	}



	public void setCamera(boolean camera) {
		this.camera = camera;
	}



	public Integer getEorder() {
		return eorder;
	}



	public void setEorder(Integer eorder) {
		this.eorder = eorder;
	}



	public String getEfiles() {
		return efiles;
	}



	public void setEfiles(String efiles) {
		this.efiles = efiles;
	}



	@Override
	public String toString() {
		return "EventVO [eventno=" + eventno + ", routeno=" + routeno + ", title=" + title + ", content=" + content
				+ ", lat=" + lat + ", lng=" + lng + ", camera=" + camera + ", eorder=" + eorder + ", efiles=" + efiles
				+ "]";
	}
	
	
}
