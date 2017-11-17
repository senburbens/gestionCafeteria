package com.gestionCafeteria.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gestionCafeteria.entreprise.PlatDuJour;
import com.gestionCafeteria.services.PlatDuJourService;

@Controller
public class IndexController {	
	
	@Autowired
	PlatDuJourService platDuJourService;
	
	
	@RequestMapping(value= {"/","/index"}, method = RequestMethod.GET)
	public String index(ModelMap model) {
		List<PlatDuJour> listePlats = platDuJourService.findAll();
		model.addAttribute("listePlats", listePlats);
		PlatDuJour p = new PlatDuJour();
		//p.setId(9);
		//p.setNomPlat("test");
		//p.setDescription("test");
		//p.setStartDate(new Date());
		//p.setEndDate(new Date("2017-11-11"));
		//platDuJourService.save(p);
		return "index";
	}
	
	/*@RequestMapping(value="/testForm", method = RequestMethod.GET)
	public String testForm() {
		return "testForm";
	}
	
	@RequestMapping(value="/testForm2", method = RequestMethod.POST)
	public String testForm2(HttpServletRequest request) {
		String firstName = request.getParameter("firstName");
		return "testForm2";
	}*/
}


