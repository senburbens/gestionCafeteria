package com.gestionCafeteria.dao;

import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import com.gestionCafeteria.entreprise.Carte;

@Repository("carteDao")
public class CarteDaoImpl extends AbstractDAO<Integer, Carte> implements CarteDao{
	@Override
	public void save(Carte carte) {
        Calendar date = Calendar.getInstance();
	    date.setTime(carte.getStartDate());
	    Format f = new SimpleDateFormat("yyyy-MM-dd");
	    //System.out.println(f.format(date.getTime()));
	    date.add(Calendar.YEAR,1);
	    DateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");;
	   try {
		carte.setEndDate(formatter.parse(f.format(date.getTime())));
	   } catch (ParseException e) {
		e.printStackTrace();
	   }
		persist(carte);		
	}
	
	public void modifier(Carte carte) {
        Calendar date = Calendar.getInstance();
	    date.setTime(carte.getStartDate());
	    Format f = new SimpleDateFormat("yyyy-MM-dd");
	    //System.out.println(f.format(date.getTime()));
	    date.add(Calendar.YEAR,1);
	    DateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");;
	   try {
		carte.setEndDate(formatter.parse(f.format(date.getTime())));
	   } catch (ParseException e) {
		e.printStackTrace();
	   }
        getSession().update(carte);
    }

	@Override
	public void supprimmer(Carte carte) {
		delete(carte);		
	}
	
	@Override
	public void supprimmer(Long id){
		String hql = "delete from Carte where numero= "+id+"";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public List<Carte> findAll() {
			Session session = getSession();
	        Query query = session.createQuery("from Carte");
	        List list = query.list();
			List<Carte> liste = list;
		return liste;
	}

	@Override
	public Carte recupererCarte(Integer id) {
		Session session = getSession();		
		//String hql = "FROM Carte C WHERE C.numero = "+id.intValue()+"";
		//Query query = session.createQuery(hql);
		//List results = query.list();
		
		//Carte carte = (Carte)results.get(0);	
		Carte carte = (Carte) session.get(Carte.class, id.intValue());
		return carte;
	}
	
	@Override
	public Carte crediterCarte(Integer numero, Long montant) {
		Carte carte = recupererCarte(numero);
		carte.setBalance((long)(Math.ceil(carte.getBalance() + montant.intValue() + montant.intValue() * 0.1)));
		modifier(carte);
		return carte;		
	}
}
