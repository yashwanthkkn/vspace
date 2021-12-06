package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.QuestionDAO;
import com.entities.Question;

@Service("questionService")
@Transactional
public class QuestionServiceImpl implements QuestionService{
	@Autowired
	private QuestionDAO dao;

	@Override
	public Question findById(int qid) {
		return dao.findById(qid);
	}

	@Override
	public void saveQuestion(Question question) {
		dao.saveQuestion(question);
	}

	@Override
	public void updateQuestion(Question question) {
		Question entity = dao.findById(question.getQid());
		if(entity != null) {
			entity.setAnswer(question.getAnswer());
			entity.setMark(question.getMark());
			entity.setQtext(question.getQtext());
		}
	}

	@Override
	public void deleteQuestionById(int qid) {
		dao.deleteQuestionById(qid);				
	}

	@Override
	public List<Question> findAllTests() {
		return dao.findAllQuestions();
	}

	@Override
	public List<Question> findQuestionsByTid(int tid) {
		return null;
	}

}
