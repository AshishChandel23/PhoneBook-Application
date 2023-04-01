/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author ASHISH KUMAR CHANDEL
 */
public class Contact {
    private int id;
    private String name;
    private String email;
    private String contact;
    private String about;
    private int userId;


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    public Contact(){
        
    }
     public Contact(int id,String name, String email, String contact, String about) {
        super();
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.about = about;
    }
    public Contact(String name, String email, String contact, String about,int userId) {
        super();
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.about = about;
        this.userId = userId;
    }
}
