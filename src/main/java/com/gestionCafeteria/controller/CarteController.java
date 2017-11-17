package com.gestionCafeteria.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gestionCafeteria.entreprise.Carte;
import com.gestionCafeteria.services.CarteService;

@Controller
public class CarteController {
	
	@Autowired
	CarteService carteService;

	@RequestMapping(value ="admin/ajouter-carte", method = RequestMethod.GET)
	public String ajouterCarte(
			@RequestParam("montant") Integer montant,
			@RequestParam("date_debut") String date_debut) {

		Carte carte = new Carte();

		carte.setBalance(montant);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			carte.setStartDate(formatter.parse(date_debut));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		carteService.save(carte);;
		return "redirect: cartes.do";
	}	

	
	@RequestMapping(value ="admin/modifier-carte", method = RequestMethod.GET)
	public String modifierCarte(@RequestParam("numero") String numero,
			@RequestParam("montant") String montant,
			@RequestParam("date_debut") String date_debut) {

		Carte carte = new Carte();

		carte.setId(Integer.parseInt(numero));
		carte.setBalance(Integer.parseInt(montant));
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			carte.setStartDate(formatter.parse(date_debut));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		carteService.modifier(carte);
		return "redirect: cartes.do";
	}

	@RequestMapping(value ="admin/supprimer-carte", method = RequestMethod.GET)
	public String supprimerCarte(@RequestParam("numero") String id) {
		carteService.supprimmer(Long.parseLong(id));
		return "redirect: cartes.do";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value ="/user/crediterCarte", method = RequestMethod.GET)
	public String crediterCarte(@RequestParam("numero") String id,
			@RequestParam("montant") String m) {
		
		Integer numero = Integer.parseInt(id);
		Long montant = Long.parseLong(m);
		Carte carte = carteService.crediterCarte(numero, montant);
		String result;

		result = "<table class=\"table table-striped\"><tr>"
					+ "		<th>ID</th><th>Solde</th><th>Date debut</th><th>Date fin</th></tr><tr>"+
					"<td>"+carte.getId()+ "</td>"+
					"<td style=\"color:green\">"+carte.getBalance()+ "</td>"+
					"<td>"+carte.getStartDate()+ "</td>"+
					"<td>"+carte.getEndDate()+ "</td>"
					+"</tr></table>";
		
		return result;
	}
	
	@ResponseBody 
    @RequestMapping(value = "/user/recupererCarte", method = RequestMethod.GET)
    public String recupererCarte(@RequestParam("numero") String id) { 
    	Carte carte = carteService.recupererCarte(Integer.parseInt(id));
    	String result;
    	 
    	if(carte != null) {
    		 result = "<table class=\"table table-striped\"><tr>"
    		 		+ "		<th>ID</th><th>Solde</th><th>Date debut</th><th>Date fin</th></tr><tr>"+
    				 	"<td>"+carte.getId()+ "</td>"+
    				 	"<td>"+carte.getBalance()+ "</td>"+
    				 	"<td>"+carte.getStartDate()+ "</td>"+
    				 	"<td>"+carte.getEndDate()+ "</td>"
    				 +"</tr></table>";
    	}else {
    		 result = "<p style=\"color : red;\">Ce numero de carte n'existe pas</p>";
    	}
        return result;
    }   
}
