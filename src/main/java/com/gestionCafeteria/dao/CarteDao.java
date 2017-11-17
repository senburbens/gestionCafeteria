package com.gestionCafeteria.dao;

import java.util.List;
import com.gestionCafeteria.entreprise.Carte;

public interface CarteDao {
	void save(Carte carte);
	void modifier(Carte carte);
	void supprimmer(Carte carte);
	void supprimmer(Long id);
	Carte recupererCarte(Integer id);
	public Carte crediterCarte(Integer numero, Long montant);
    List<Carte> findAll();
}
