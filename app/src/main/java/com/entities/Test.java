package com.entities;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Test {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int tid;
	private String tname;
	private String state="edit";
	private float duration;
	private String start_time;
	private String date;
	
	@OneToMany(mappedBy = "test",cascade = CascadeType.ALL)
	private List<Question> questions;
	
	
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public float getDuration() {
		return duration;
	}
	public void setDuration(float duration) {
		this.duration = duration;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Test [tid=" + tid + ", tname=" + tname + ", state=" + state + ", duration=" + duration + ", start_time="
				+ start_time + ", date=" + date + "]";
	}
	public Test(String tname, String state, float duration, String start_time, String date) {
		super();
		this.tname = tname;
		this.state = state;
		this.duration = duration;
		this.start_time = start_time;
		this.date = date;
	}
	public Test() {
		
	}
	

}
