package com.gestionCafeteria.services;

import java.util.List;

import com.gestionCafeteria.entreprise.PlatDuJour;

public interface PlatDuJourService {
	void save(PlatDuJour platDuJour);	
	void modifier(PlatDuJour platDuJour);
	void supprimmer(PlatDuJour platDuJour);     
	public void supprimmer(Long id);
    List<PlatDuJour> findAll();
    public PlatDuJour recupererPlat(Integer id);
}
