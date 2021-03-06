package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Answer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int oid;
	private String answer;
	
	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	@ManyToOne()
	@JoinColumn(name="qid")
	private Question question;
	
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Answer()
	{
		
	}

	public String getAnswer() {
		return answer;
	}

	@Override
	public String toString() {
		return "Answer [oid=" + oid + ", answer=" + answer + ", question=" + question + "]";
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
