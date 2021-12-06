package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ResultDAO;
import com.entities.Result;

@Service("resultService")
@Transactional
public class ResultServiceImpl implements ResultService{
	
	@Autowired
	ResultDAO dao;
	@Override
	public Result findById(int tid) {
		return dao.findById(tid);
	}

	@Override
	public void saveResult(Result result) {
		dao.saveResult(result);
	}

	@Override
	public void updateResult(Result result) {
	//	Result entity=dao.findById(result.ge)
		
	}

	@Override
	public void deleteResultById(int tid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Result> findAllResults() {
		// TODO Auto-generated method stub
		return null;
	}

}
