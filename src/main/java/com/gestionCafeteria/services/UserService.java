package com.gestionCafeteria.services;

import java.util.List;

import com.gestionCafeteria.entreprise.User;
 
public interface UserService {
 
    User findById(int id);
     
    User findBySso(String sso);

    void save(User user);
     
    void updateUser(User user);
     
    void deleteUserBySSO(String sso);
 
    List<User> findAllUsers(); 
     
    boolean isUserSSOUnique(Integer id, String sso);
     
}
