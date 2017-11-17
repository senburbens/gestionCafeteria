package com.gestionCafeteria.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gestionCafeteria.entreprise.PlatDuJour;
import com.gestionCafeteria.services.PlatDuJourService;

@Controller
public class PlatController {

	@Autowired
	PlatDuJourService platDuJourService;

	@RequestMapping(value ="admin/ajouter-plat", method = RequestMethod.GET)
	public String ajouterPlat(
			@RequestParam("nom") String nom,
			@RequestParam("description") String description,
			@RequestParam("date_debut") String date_debut,
			@RequestParam("date_fin") String date_fin) {

		PlatDuJour platDuJour = new PlatDuJour();

		platDuJour.setNomPlat(nom);
		platDuJour.setDescription(description);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			platDuJour.setStartDate(formatter.parse(date_debut));
			platDuJour.setEndDate(formatter.parse(date_fin));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		platDuJourService.save(platDuJour);;
		return "redirect: /index.do";
	}	

	@RequestMapping(value ="admin/modifier-plat", method = RequestMethod.GET)
	public String modifierPlat(@RequestParam("id") String id,
			@RequestParam("nom") String nom,
			@RequestParam("description") String description,
			@RequestParam("date_debut") String date_debut,
			@RequestParam("date_fin") String date_fin) {

		PlatDuJour platDuJour = new PlatDuJour();

		platDuJour.setId(Integer.parseInt(id));
		platDuJour.setNomPlat(nom);
		platDuJour.setDescription(description);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			platDuJour.setStartDate(formatter.parse(date_debut));
			platDuJour.setEndDate(formatter.parse(date_fin));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		platDuJourService.modifier(platDuJour);;
		return "redirect: /index.do";
	}		

	@RequestMapping(value ="admin/supprimer-plat", method = RequestMethod.GET)
	public String supprimerPlat(@RequestParam("id_plat") String id) {
		platDuJourService.supprimmer(Long.parseLong(id));
		return "redirect: /index.do";
	}	
}
