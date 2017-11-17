package com.gestionCafeteria.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.gestion_cafeteria.services.UserServicesInterface;


@Controller
public class UserController {	
	//@Autowired
	//private UserServicesInterface userServices;

	@RequestMapping("/user/index")
	public String userIndexPage() {
		return "user/index";
	}
	
	/*@RequestMapping("adduser")
	public void addUser() {
	}*/
}
