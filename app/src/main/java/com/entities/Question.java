package com.entities;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int qid;
	private String qtext;
	private String answer;
	private int mark;
	
	@ManyToOne
	@JoinColumn(name="tid")
	private Test test;
	
	@OneToMany(mappedBy = "question",cascade = CascadeType.ALL)
	private List<Answer> options;
	
	
	public Test getTest() {
		return test;
	}
	public void setTest(Test test) {
		this.test = test;
	}
	
	public List<Answer> getOptions() {
		return options;
	}
	public void setOptions(List<Answer> options) {
		this.options = options;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getQtext() {
		return qtext;
	}
	public void setQtext(String qtext) {
		this.qtext = qtext;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	@Override
	public String toString() {
		return "Question [qid=" + qid + ", qtext=" + qtext + ", answer=" + answer + ", mark=" + mark + "]";
	}
	public Question(String qtext, String answer, int mark) {
		super();
		this.qtext = qtext;
		this.answer = answer;
		this.mark = mark;
	}
	public Question() {
		
	}
	
}
