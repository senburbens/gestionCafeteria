package com.gestionCafeteria.dao;
 
import java.util.List;
 
import com.gestionCafeteria.entreprise.UserProfile;
 
 
public interface UserProfileDao {
 
    List<UserProfile> findAll();
     
    UserProfile findByType(String type);
     
    UserProfile findById(int id);
}
