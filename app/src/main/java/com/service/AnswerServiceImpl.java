package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AnswerDAO;
import com.entities.Answer;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDAO dao;
	
	@Override
	public Answer findById(int optid) {
		return dao.findById(optid);
	}

	@Override
	public List<Answer> findAllAnswer() {
		return dao.findAllAnswers();
	}

	@Override
	public List<Answer> findAllAnswerByQid(int qid) {
		return dao.findAllAnswersByQid(qid);
	}

}
