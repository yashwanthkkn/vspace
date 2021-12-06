package com.dao;

import java.util.List;

import javax.websocket.Session;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
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

	@Override
	public List<Question> findAllQuestionsByTid(int tid) {
//		Query<Question> q = getSession().createQuery("from Question q where q.test.tid=?");
//		q.setInteger(tid, 0);
//		List<Question> questions = q.getResultList();
//		return questions;
		Criteria criteria = createEntityCriteria();
		System.out.println("Got here");
		return (List<Question>) criteria.add(Restrictions.eq("test.tid", tid)).list();
	}

}
