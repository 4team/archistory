package org.kkamnyang.domain;

public class RankingVO {
	
	private String userName;
	private java.lang.Integer score;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public java.lang.Integer getScore() {
		return score;
	}
	public void setScore(java.lang.Integer score) {
		this.score = score;
	}
	
	@Override
	public String toString() {
		return "RankingVO [userName=" + userName + ", score=" + score + "]";
	}
	
	
}
