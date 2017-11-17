package com.gestionCafeteria.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gestionCafeteria.dao.ClientDao;
import com.gestionCafeteria.entreprise.Client;


@Service("clientService")
@Transactional

public class ClientServiceImpl implements ClientService{

	@Autowired
	ClientDao clientDao;

	@Override
	public void save(Client client) {
		clientDao.save(client);
	}

	@Override
	public void modifier(Client client){
		clientDao.modifier(client);
	}

	@Override
	public void supprimer(Client client) {
		clientDao.supprimer( client);
	}

	@Override
	public List<Client> findAll() {
		return clientDao.findAll();
	}

	@Override
	public void supprimer(Long id) {
		clientDao.supprimer(id);	
	}

}
