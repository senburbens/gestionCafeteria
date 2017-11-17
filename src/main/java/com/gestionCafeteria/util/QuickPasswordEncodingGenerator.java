package com.gestionCafeteria.util;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 
public class QuickPasswordEncodingGenerator { 
    /**
     * @param args
     */
    public static void main(String[] args) {
            String password = "senburbensnew";
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            System.out.println(passwordEncoder.encode(password));
    }
 
}