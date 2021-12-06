package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Answer;
import com.entities.Question;

@Repository("AnswerDAO")
@Transactional
public class AnswerDAOImpl extends AbstractDAO<Integer, Answer> implements AnswerDAO{

	@Override
	public Answer findById(int optid) {
		return getByKey(optid);
	}

	@Override
	public void saveAnswer(Answer answer) {
		persist(answer);
		
	}

	@Override
	public void deleteAnswerById(int optid) {
		Criteria criteria =  createEntityCriteria();
	       Answer answer=(Answer)criteria.add(Restrictions.eq("optid", optid)).uniqueResult();
	        delete(answer);
		
	}

	@Override
	public List<Answer> findAllAnswers() {
		Criteria criteria = createEntityCriteria();
        return (List<Answer>) criteria.list();
	}

	@Override
	public List<Answer> findAllAnswersByQid(int qid) {
		Criteria criteria = createEntityCriteria();
		return (List<Answer>) criteria.add(Restrictions.eq("question.qid", qid)).list();
	}

}
