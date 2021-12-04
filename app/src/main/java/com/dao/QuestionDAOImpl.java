package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Question;
import com.entities.Test;

@Repository("QuestionDAO")
@Transactional
public class QuestionDAOImpl extends AbstractDAO<Integer, Question> implements QuestionDAO{

	@Override
	public Question findById(int qid) {
		return getByKey(qid);
	}

	@Override
	public void saveQuestion(Question question) {
		persist(question);
		
	}

	@Override
	public void deleteQuestionById(int qid) {
		Criteria criteria =  createEntityCriteria();
	       Question question=(Question)criteria.add(Restrictions.eq("qid", qid)).uniqueResult();
	        delete(question);
	}

	@Override
	public List<Question> findAllQuestions() {
		Criteria criteria = createEntityCriteria();
        return (List<Question>) criteria.list();
	}

}
