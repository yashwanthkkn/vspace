package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Answer;
import com.entities.Result;

@Repository("ResultDAO")
@Transactional
public class ResultDAOImpl extends AbstractDAO<Integer, Result> implements ResultDAO{

	@Override
	public Result findById(int tid) {
		return getByKey(tid);
	}

	@Override
	public void saveResult(Result result) {
		persist(result);
		
	}

	@Override
	public void deleteResultById(int tid) {
		Criteria criteria =  createEntityCriteria();
	    Result result=(Result)criteria.add(Restrictions.eq("tid", tid)).uniqueResult();
	    delete(result);	
	}

	@Override
	public List<Result> findAllResults() {
		Criteria criteria = createEntityCriteria();
        return (List<Result>) criteria.list();
	}

}
