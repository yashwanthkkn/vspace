package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Participation;
import com.entities.ParticipationPk;
import com.entities.Question;
import com.entities.Result;
import com.entities.User;

@Repository("ParticipationDAO")
@Transactional
public class ParticipationDAOImpl extends AbstractDAO<ParticipationPk, Participation> implements ParticipationDAO {

	@Override
	public Participation findById(ParticipationPk pk) {
		return getByKey(pk);
	}

	@Override
	public void saveParticipation(Participation participation) {
		persist(participation);
	}

	@Override
	public void deleteParticipation(Participation participation) {
		delete(participation);
	}

	@Override
	public List<Participation> findAllParticipation() {
		Criteria criteria = createEntityCriteria();
        return (List<Participation>) criteria.list();
	}

	@Override
	public List<Participation> findAllParticipationByUserId(int uid) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("pk.uid", uid));  
		return (List<Participation>) criteria.add(Restrictions.eq("pk.uid", uid)).list();
	}

}
