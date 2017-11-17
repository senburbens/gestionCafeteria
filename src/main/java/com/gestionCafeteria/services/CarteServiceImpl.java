package com.gestionCafeteria.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gestionCafeteria.dao.CarteDao;
import com.gestionCafeteria.entreprise.Carte;

@Service("carteService")
@Transactional
public class CarteServiceImpl implements CarteService{
	@Autowired
	CarteDao carteDao;

	@Override
	public void save(Carte carte) {
		carteDao.save(carte);
	}

	@Override
	public void modifier(Carte carte) {
		carteDao.modifier(carte);
	}

	@Override
	public void supprimmer(Carte carte) {
		carteDao.supprimmer(carte);
	}
	
	@Override
	public void supprimmer(Long id){
		carteDao.supprimmer(id);
	}

	@Override
	public List<Carte> findAll() {
		return carteDao.findAll();
	}

	public Carte recupererCarte(Integer id) {
		return carteDao.recupererCarte(id);
	}
	
	public Carte crediterCarte(Integer numero, Long montant) {
		return carteDao.crediterCarte(numero, montant);
	}
}
