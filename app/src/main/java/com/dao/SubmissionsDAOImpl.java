package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Result;
import com.entities.Submission;
import com.entities.SubmissionPk;

@Repository("SubmissionsDAO")
@Transactional
public class SubmissionsDAOImpl extends AbstractDAO<SubmissionPk, Submission> implements SubmissionsDAO{

	@Override
	public Submission findById(SubmissionPk pk) {
		return getByKey(pk);
	}

	@Override
	public void saveSubmission(Submission submissions) {
		persist(submissions);
		
	}

	@Override
	public void deleteSubmission(Submission submission) {
	    delete(submission);
	}

	@Override
	public List<Submission> findAllSubmissionss() {
		Criteria criteria = createEntityCriteria();
        return (List<Submission>) criteria.list();
	}

	@Override
	public List<Submission> findSubmissionsById(SubmissionPk pk) {
		Criteria criteria = createEntityCriteria();
        return (List<Submission>) getByKey(pk);
	}

}
