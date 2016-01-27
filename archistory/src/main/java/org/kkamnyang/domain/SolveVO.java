package org.kkamnyang.domain;

import java.util.Date;

public class SolveVO {
	private java.lang.Integer solveno;
	private java.lang.Integer memberno;
	private java.lang.Integer questionno;
	private java.lang.Boolean result;
	private Date solvedate;
	
	public java.lang.Integer getSolveno() {
		return solveno;
	}
	public void setSolveno(java.lang.Integer solveno) {
		this.solveno = solveno;
	}
	public java.lang.Integer getMemberno() {
		return memberno;
	}
	public void setMemberno(java.lang.Integer memberno) {
		this.memberno = memberno;
	}
	public java.lang.Integer getQuestionno() {
		return questionno;
	}
	public void setQuestionno(java.lang.Integer questionno) {
		this.questionno = questionno;
	}
	public java.lang.Boolean getResult() {
		return result;
	}
	public void setResult(java.lang.Boolean result) {
		this.result = result;
	}
	public Date getSolvedate() {
		return solvedate;
	}
	public void setSolvedate(Date solvedate) {
		this.solvedate = solvedate;
	}
	
	@Override
	public String toString() {
		return "SolveVO [solveno=" + solveno + ", memberno=" + memberno + ", questionno=" + questionno + ", result="
				+ result + ", solvedate=" + solvedate + "]";
	}
	

}
