package com.util;

import java.util.List;

import com.entities.Participation;
import com.entities.Submission;
import com.entities.Test;

public class Report {
	private Test test;
	private Participation participation;
	private List<Submission> submission;
	public final void setSubmission(List<Submission> submission) {
		this.submission = submission;
	}
	public Test getTest() {
		return test;
	}
	public void setTest(Test test) {
		this.test = test;
	}
	public Participation getParticipation() {
		return participation;
	}
	public void setParticipation(Participation participation) {
		this.participation = participation;
	}
	
	public Report(Test test, Participation participation, List<Submission> submission) {
		super();
		this.test = test;
		this.participation = participation;
		this.submission = submission;
	}
	
	
}
