package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.TestDAO;
import com.entities.Test;

@Service("testService")
@Transactional
public class TestServiceImpl implements TestService{
	@Autowired
	TestDAO dao;
	@Override
	public Test findById(int tid) {
		return dao.findById(tid);
	}

	@Override
	public void saveTest(Test test) {
		dao.saveTest(test);
		
	}

	@Override
	public void updateTest(Test test) {
		Test entity=dao.findById(test.getTid());
		if(entity!=null) {
			entity.setDate(test.getDate());
			entity.setDuration(test.getDuration());
			entity.setStart_time(test.getStart_time());
			entity.setTname(test.getTname());
			entity.setState(test.getState());
			entity.setTotalMarks(test.getTotalMarks());
		}
		
	}

	@Override
	public void deleteTestById(int tid) {
		dao.deleteTestById(tid);
		
	}

	@Override
	public List<Test> findAllTests() {
		return dao.findAllTests();
	}

	@Override
	public Test findTestByTestName(String tname) {
		return dao.findTestByTestName(tname);
	}

	@Override
	public List<Test> findByState(String state) {
		return dao.findByState(state);
	}

}
