package com.gestionCafeteria.services;

import java.util.List;

import com.gestionCafeteria.entreprise.Client;

public interface ClientService {
	void save(Client client);	
	void modifier(Client client);
	void supprimer(Client client);  
	public void supprimer(Long id);
    List<Client> findAll();
}
