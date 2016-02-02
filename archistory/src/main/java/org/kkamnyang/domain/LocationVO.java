package org.kkamnyang.domain;

public class LocationVO {

	private double myLat;
	private double myLng;
	public double getMyLat() {
		return myLat;
	}
	public void setMyLat(double myLat) {
		this.myLat = myLat;
	}
	public double getMyLng() {
		return myLng;
	}
	public void setMyLng(double myLng) {
		this.myLng = myLng;
	}
	@Override
	public String toString() {
		return "LocationVO [myLat=" + myLat + ", myLng=" + myLng + "]";
	}
}
