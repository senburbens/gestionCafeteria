package com.gestionCafeteria.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gestionCafeteria.entreprise.PlatDuJour;

public interface PlatDuJourDao {	 
	    public  void save(PlatDuJour platDuJour);
		public  void modifier(PlatDuJour platDuJour);
		public  void supprimmer(PlatDuJour platDuJour);
		public  void supprimmer(Long id);
		public  List<PlatDuJour> findAll();
	    public PlatDuJour recupererPlat(Integer id);
}
