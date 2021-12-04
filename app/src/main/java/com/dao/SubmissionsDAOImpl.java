package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Result;
import com.entities.Submissions;

@Repository("SubmissionsDAO")
@Transactional
public class SubmissionsDAOImpl extends AbstractDAO<Integer, Submissions> implements SubmissionsDAO{

	@Override
	public Submissions findById(int qid) {
		return getByKey(qid);
	}

	@Override
	public void saveSubmissions(Submissions submissions) {
		persist(submissions);
		
	}

	@Override
	public void deleteSubmissionsById(int qid) {
		Criteria criteria =  createEntityCriteria();
	       Submissions sub=(Submissions)criteria.add(Restrictions.eq("qid", qid)).uniqueResult();
	        delete(sub);
		
	}

	@Override
	public List<Submissions> findAllSubmissionss() {
		Criteria criteria = createEntityCriteria();
        return (List<Submissions>) criteria.list();
	}

}
