package com.gestionCafeteria.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gestionCafeteria.entreprise.Carte;
import com.gestionCafeteria.entreprise.Client;
import com.gestionCafeteria.entreprise.PlatDuJour;
import com.gestionCafeteria.services.CarteService;
import com.gestionCafeteria.services.ClientService;
import com.gestionCafeteria.services.PlatDuJourService;

@Controller
public class AdminController {
	
	@Autowired
	PlatDuJourService platDuJourService;
	
	@Autowired
	CarteService carteService;
	
	@Autowired
	ClientService clientService;
	
	@RequestMapping("/admin/index")
	public String adminIndexPage(ModelMap model) {
		List<PlatDuJour> listePlats = platDuJourService.findAll();
		model.addAttribute("listePlats", listePlats);
		return "admin/index";
	}
	
	
	@RequestMapping("/admin/clients")
	public String inventairePage(ModelMap model) {
		List<Client> listeClient = clientService.findAll();
		model.addAttribute("listeClient", listeClient);
		return "admin/clients";
	}
	
	@RequestMapping("/admin/cartes")
	public String cartesPage(ModelMap model) {
		List<Carte> listeCartes = carteService.findAll();
		model.addAttribute("listeCartes", listeCartes);
		return "admin/cartes";
	}	
	

    @RequestMapping(value = "/admin/recupererPlat", method = RequestMethod.GET)
    public 	@ResponseBody  PlatDuJour recupererPlat(@RequestParam("numero") String id) { 
		PlatDuJour platDuJour = platDuJourService.recupererPlat(Integer.parseInt(id));
        return platDuJour;
    }   
}
