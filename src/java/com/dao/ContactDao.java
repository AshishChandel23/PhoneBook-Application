/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASHISH KUMAR CHANDEL
 */
public class ContactDao {
    
    private Connection con;
    
    public ContactDao(Connection con){
        super();
        this.con = con;
    }
    
    public boolean saveContact(Contact c){
        boolean f = false;
        
        String sql = "insert into Contact(name,email,contact,about,userid) values (?,?,?,?,?)";
        PreparedStatement pre;
        try {
            pre = con.prepareStatement(sql);
            pre.setString(1,c.getName());
            pre.setString(2,c.getEmail());
            pre.setString(3,c.getContact());
            pre.setString(4,c.getAbout());
            pre.setInt(5,c.getUserId());
            int i = pre.executeUpdate();
            if(i==1) f=true;
            
        } catch (SQLException ex) {
            Logger.getLogger(ContactDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

    /**
     *
     * @param uId
     * @return
     */
    public List<Contact> getAllContacts(int uId){
        List<Contact> list = new ArrayList<>();
        Contact c = null;
        try {
            PreparedStatement pre = con.prepareStatement("Select * from contact where UserId=?");
            pre.setInt(1,uId);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                c = new Contact(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
//                c.setId(rs.getInt(1));
//                c.setName(rs.getString(2));
//                c.setEmail(rs.getString(3));
//                c.setContact(rs.getString(4));
//                c.setAbout(rs.getString(5));
                list.add(c);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ContactDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public Contact getContactById(int cid){
        Contact c = new Contact();
        
        try {
            PreparedStatement pre = con.prepareStatement("Select * from contact where id=?");
            pre.setInt(1,cid);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setContact(rs.getString(4));
                c.setAbout(rs.getString(5));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContactDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return c;
    }
    public boolean updateContact(Contact c){
        boolean f = false;
        
        String sql = "Update Contact set Name=?,Email=?,Contact=?,About=? where Id=?";
        PreparedStatement pre;
        try {
            pre = con.prepareStatement(sql);
            pre.setString(1,c.getName());
            pre.setString(2,c.getEmail());
            pre.setString(3,c.getContact());
            pre.setString(4,c.getAbout());
            pre.setInt(5,c.getId());
            int i = pre.executeUpdate();
            if(i==1) f=true;
            
        } catch (SQLException ex) {
            Logger.getLogger(ContactDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
    public boolean deleteContactById(int cid){
        boolean f = false;
        
        String sql = "Delete from Contact where Id=?";
        PreparedStatement pre;
        try {
            pre = con.prepareStatement(sql);
            pre.setInt(1,cid);
            int i = pre.executeUpdate();
            if(i==1) f=true;
            
        } catch (SQLException ex) {
            Logger.getLogger(ContactDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
}
