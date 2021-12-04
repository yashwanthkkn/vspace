package com.entities;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class Submissions implements Serializable{
	@EmbeddedId
	CompKey_Submissions compkey;
	private String choice;
	private String state;
	private int mark;
	private String rightanswer;
	public CompKey_Submissions getCompkey() {
		return compkey;
	}
	public void setCompkey(CompKey_Submissions compkey) {
		this.compkey = compkey;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public String getRightanswer() {
		return rightanswer;
	}
	public void setRightanswer(String rightanswer) {
		this.rightanswer = rightanswer;
	}
	@Override
	public String toString() {
		return "Submissions [compkey=" + compkey + ", choice=" + choice + ", state=" + state + ", mark=" + mark
				+ ", rightanswer=" + rightanswer + "]";
	}
	

}
