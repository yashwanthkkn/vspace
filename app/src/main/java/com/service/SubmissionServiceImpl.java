package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SubmissionsDAO;
import com.entities.Submission;
import com.entities.SubmissionPk;

@Service("submissionService")
@Transactional
public class SubmissionServiceImpl implements SubmissionService {

	@Autowired
	private SubmissionsDAO dao;
	
	@Override
	public Submission findById(SubmissionPk pk) {
		return dao.findById(pk);
	}

	@Override
	public void saveSubmission(Submission submission) {
		dao.saveSubmission(submission);
		
	}

	@Override
	public void deleteSubmission(Submission submission) {
		dao.deleteSubmission(submission);
	}

	@Override
	public List<Submission> findAllSubmissions() {
		return dao.findAllSubmissionss();
	}

	@Override
	public List<Submission> findSubmissionsById(SubmissionPk pk) {
		return dao.findSubmissionsById(pk);
	}

}
