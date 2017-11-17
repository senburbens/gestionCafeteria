package com.gestionCafeteria.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.gestionCafeteria.entreprise.Carte;
import com.gestionCafeteria.entreprise.PlatDuJour;

@Repository("platDuJourDao")
public class PlatDuJourDaoImpl extends AbstractDAO<Integer, PlatDuJour> implements PlatDuJourDao{

	@Override
	public void save(PlatDuJour platDuJour) {
		persist(platDuJour);		
	}
	
	public void modifier(PlatDuJour platDuJour) {
        getSession().update(platDuJour);
    }

	@Override
	public void supprimmer(PlatDuJour platDuJour) {
		delete(platDuJour);		
	}
	
	@Override
	public void supprimmer(Long id){
		String hql = "delete from PlatDuJour where id= "+id+"";//:classId";
		//getSession().createQuery(hql).setBigInteger("classId", id).executeUpdate();
		//.setString("classId", id).executeUpdate();
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public List<PlatDuJour> findAll() {
        //Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
        //criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
			Session session = getSession();
	        Query query = session.createQuery("from PlatDuJour");
	        List list = query.list();
			List<PlatDuJour> liste = list;
		return liste;
	}
	
	@Override
    public PlatDuJour recupererPlat(Integer id) {
		Session session = getSession();		
		PlatDuJour platDuJour = (PlatDuJour) session.get(PlatDuJour.class, id.intValue());
		return platDuJour;
    }
}
