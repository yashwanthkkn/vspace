package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Test;
import com.entities.User;

@Repository("TestDAO")
@Transactional
public class TestDAOImpl extends AbstractDAO<Integer, Test> implements TestDAO{

	@Override
	public Test findById(int tid) {
		return getByKey(tid);
	}

	@Override
	public void saveTest(Test test) {
		persist(test);
		
	}

	@Override
	public void deleteTestById(int tid) {
		Criteria criteria =  createEntityCriteria();
	       Test test=(Test)criteria.add(Restrictions.eq("tid", tid)).uniqueResult();
	        delete(test);
		
	}

	@Override
	public List<Test> findAllTests() {
		Criteria criteria = createEntityCriteria();
        return (List<Test>) criteria.list();
	}

	@Override
	public Test findTestByTestName(String tname) {
		Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("tname", tname));
        
        return (Test) criteria.uniqueResult();
	}

}
