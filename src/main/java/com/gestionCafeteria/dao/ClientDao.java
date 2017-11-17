package com.gestionCafeteria.dao;

import java.util.List;

import com.gestionCafeteria.entreprise.Client;

public interface ClientDao {
	void save(Client client);
	void modifier(Client client);
	void supprimer(Client client);
	void supprimer(Long id);
    List<Client> findAll();
}
