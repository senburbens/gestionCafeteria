package com.gestionCafeteria.services;
 
import java.util.List;
 
import com.gestionCafeteria.entreprise.UserProfile;
 
 
public interface UserProfileService {
 
    UserProfile findById(int id);
 
    UserProfile findByType(String type);
     
    List<UserProfile> findAll();
     
}
