package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ParticipationDAO;
import com.entities.Participation;
import com.entities.ParticipationPk;

@Service("participationService")
@Transactional
public class ParticipationServiceImpl implements ParticipationService {

	@Autowired
	private ParticipationDAO dao;
	
	@Override
	public Participation findById(ParticipationPk pk) {
		return dao.findById(pk);
	}

	@Override
	public void saveParticipation(Participation participation) {
		dao.saveParticipation(participation);
	}

	@Override
	public void updateParticipation(Participation participation) {
		Participation entity = dao.findById(participation.getPk());
		if(entity != null) {
			entity.setScore(participation.getScore());
			entity.setLast_attempted(participation.getLast_attempted());
			entity.setTotalQn(participation.getTotalQn());
			entity.setPaymentDone(participation.isPaymentDone());
		}
	}

	@Override
	public void deleteParticipation(Participation participation) {
		dao.deleteParticipation(participation);
	}

	@Override
	public List<Participation> findAllParticipation() {
		return dao.findAllParticipation();
	}

	@Override
	public List<Participation> findParticipationsByUid(int uid) {
		return dao.findAllParticipationByUserId(uid);
	}

}
