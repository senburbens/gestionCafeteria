package com.gestionCafeteria.dao;

import java.util.List;

import com.gestionCafeteria.entreprise.User;
 
public interface UserDao {
 
    void save(User user);
	
    User findById(int id);
     
    User findBySSO(String sso);

    void deleteBySSO(String sso);
     
    List<User> findAllUsers();
     
}
