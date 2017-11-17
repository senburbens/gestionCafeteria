package com.gestionCafeteria.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gestionCafeteria.dao.PlatDuJourDao;
import com.gestionCafeteria.entreprise.PlatDuJour;

@Service("platDuJourService")
@Transactional
public class PlatDuJourServiceImpl implements PlatDuJourService{
	
	@Autowired
	PlatDuJourDao platDuJourDao;

	@Override
	public void save(PlatDuJour platDuJour) {
		platDuJourDao.save(platDuJour);
	}

	@Override
	public void modifier(PlatDuJour platDuJour) {
		platDuJourDao.modifier(platDuJour);
	}

	@Override
	public void supprimmer(PlatDuJour platDuJour) {
		platDuJourDao.supprimmer(platDuJour);
	}
	
	@Override
	public void supprimmer(Long id){
		platDuJourDao.supprimmer(id);
	}


	@Override
	public List<PlatDuJour> findAll() {
		return platDuJourDao.findAll();
	}

	@Override
	public PlatDuJour recupererPlat(Integer id) {
		return platDuJourDao.recupererPlat(id);
	}
}
