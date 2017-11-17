package com.gestionCafeteria.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gestionCafeteria.entreprise.Carte;
import com.gestionCafeteria.entreprise.Client;
import com.gestionCafeteria.services.ClientService;

@Controller
public class ClientController {
	
	@Autowired
	ClientService clientService;

	@RequestMapping(value ="admin/ajouter-client", method = RequestMethod.GET)
	public String ajouterCarte(
			@RequestParam("nom") String nom,
			@RequestParam("prenom") String prenom,
			@RequestParam("email") String email,
			@RequestParam("adresse") String adresse,
			@RequestParam("statut") String statut) {

		Client client = new Client();

		client.setAdresse(adresse);
		client.setEmail(email);
		client.setNom(nom);
		client.setPrenom(prenom);
		client.setStatut(statut);
		
		clientService.save(client);
		return "redirect: clients.do";
	}	

	
	@RequestMapping(value ="admin/modifier-client", method = RequestMethod.GET)
	public String modifierClient(
			@RequestParam("id") Integer id,
			@RequestParam("nom") String nom,
			@RequestParam("prenom") String prenom,
			@RequestParam("email") String email,
			@RequestParam("adresse") String adresse,
			@RequestParam("statut") String statut) {

		Client client = new Client();

		client.setId(id);
		client.setAdresse(adresse);
		client.setEmail(email);
		client.setNom(nom);
		client.setPrenom(prenom);
		client.setStatut(statut);
		
		clientService.modifier(client);
		
		return "redirect: clients.do";
	}
	

	@RequestMapping(value ="admin/supprimer-client", method = RequestMethod.GET)
	public String supprimerClient(@RequestParam("id") String id) {
		clientService.supprimer(Long.parseLong(id));
		
		return "redirect: clients.do";
	}
}