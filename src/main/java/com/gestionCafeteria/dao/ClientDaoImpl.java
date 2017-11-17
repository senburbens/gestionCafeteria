package com.gestionCafeteria.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import com.gestionCafeteria.entreprise.Client;

@Repository("clientDao")
public class ClientDaoImpl extends AbstractDAO<Integer, Client> implements ClientDao{
	@Override
	public void save(Client client) {
		persist(client);		
	}

	public void modifier(Client client) {
        getSession().update(client);
    }

	@Override
	public void supprimer(Client client) {
		delete(client);		
	}

	@Override
	public List<Client> findAll() {
			Session session = getSession();
	        Query query = session.createQuery("from Client");
	        List list = query.list();
			List<Client> liste = list;
		return liste;
	}

	@Override
	public void supprimer(Long id) {
			String hql = "delete from Client where id= "+id+"";
			getSession().createQuery(hql).executeUpdate();
	}
}