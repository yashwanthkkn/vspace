package com.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.entities.Participation;
import com.entities.ParticipationPk;
import com.entities.Submission;
import com.entities.SubmissionPk;
import com.entities.Test;
import com.service.ParticipationService;
import com.service.SubmissionService;
import com.service.TestService;

public class ReportHelper {
	
	@Autowired
	private static TestService testService;
	
	@Autowired
	private static ParticipationService participationService;
	
	@Autowired
	private static ParticipationPk pk;
	
	@Autowired
	private static SubmissionService submissionService;
	
	@Autowired
	private static SubmissionPk sk;
	public static  Report getReport(int tid,int uid) {
		
		Test test=testService.findById(tid);
		pk.setTid(tid);
		pk.setUid(uid);
		Participation participation=participationService.findById(pk);
		sk.setTid(tid);
		sk.setUid(uid);
		List<Submission> submissions=submissionService.findSubmissionsById(sk);
		Report report=new Report(test,participation,submissions);
		return report;
	}

}
