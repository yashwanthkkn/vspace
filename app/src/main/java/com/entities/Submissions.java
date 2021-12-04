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
	public final CompKey_Submissions getCompkey() {
		return compkey;
	}
	public final void setCompkey(CompKey_Submissions compkey) {
		this.compkey = compkey;
	}
	public final String getChoice() {
		return choice;
	}
	public final void setChoice(String choice) {
		this.choice = choice;
	}
	public final String getState() {
		return state;
	}
	public final void setState(String state) {
		this.state = state;
	}
	public final int getMark() {
		return mark;
	}
	public final void setMark(int mark) {
		this.mark = mark;
	}
	public final String getRightanswer() {
		return rightanswer;
	}
	public final void setRightanswer(String rightanswer) {
		this.rightanswer = rightanswer;
	}
	@Override
	public String toString() {
		return "Submissions [compkey=" + compkey + ", choice=" + choice + ", state=" + state + ", mark=" + mark
				+ ", rightanswer=" + rightanswer + "]";
	}
	

}
