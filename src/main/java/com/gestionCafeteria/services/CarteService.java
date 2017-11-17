package com.gestionCafeteria.services;

import java.util.List;
import com.gestionCafeteria.entreprise.Carte;

public interface CarteService {
	void save(Carte carte);	
	void modifier(Carte carte);
	void supprimmer(Carte carte);     
	public void supprimmer(Long id);
    List<Carte> findAll();
	public Carte recupererCarte(Integer id);
	public Carte crediterCarte(Integer numero, Long montant);
}
