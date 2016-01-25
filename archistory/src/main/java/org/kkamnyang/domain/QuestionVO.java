package org.kkamnyang.domain;

public class QuestionVO {
	
	private Integer questionno;
	private Integer eventno;
	private String question;
	private String answer;
	private Integer point;
	private String qtype;
	private String choice1;
	private String choice2;
	private String choice3;
	private String choice4;
	
	public Integer getQuestionno() {
		return questionno;
	}
	public void setQuestionno(Integer questionno) {
		this.questionno = questionno;
	}
	public Integer getEventno() {
		return eventno;
	}
	public void setEventno(Integer eventno) {
		this.eventno = eventno;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public String getQtype() {
		return qtype;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public String getChoice1() {
		return choice1;
	}
	public void setChoice1(String choice1) {
		this.choice1 = choice1;
	}
	public String getChoice2() {
		return choice2;
	}
	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}
	public String getChoice3() {
		return choice3;
	}
	public void setChoice3(String choice3) {
		this.choice3 = choice3;
	}
	public String getChoice4() {
		return choice4;
	}
	public void setChoice4(String choice4) {
		this.choice4 = choice4;
	}
	@Override
	public String toString() {
		return "QuestionVO [questionno=" + questionno + ", eventno=" + eventno + ", question=" + question + ", answer="
				+ answer + ", point=" + point + ", qtype=" + qtype + ", choice1=" + choice1 + ", choice2=" + choice2
				+ ", choice3=" + choice3 + ", choice4=" + choice4 + "]";
	}

	
	
	

}
