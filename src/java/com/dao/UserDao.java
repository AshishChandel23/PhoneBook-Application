/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author ASHISH KUMAR CHANDEL
 */
public class UserDao {
    private Connection con;
    public UserDao(Connection con){
        super();
        this.con = con;
    }
    public boolean userRegister(User u){
        boolean f = false;
        String sql = "insert into user (Name,Email,Password) values(?,?,?)";
        PreparedStatement pre;
        try {
            pre = con.prepareStatement(sql);
            pre.setString(1,u.getName());
            pre.setString(2,u.getEmail());
            pre.setString(3,u.getPassword());
            int i = pre.executeUpdate();
            
            if(i==1) f=true;
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
    public User userLogin(String email,String password){
        User user=null;
        String sql = "Select * from User where Email=? and Password=?";
        PreparedStatement pre;
        try {
            pre = con.prepareStatement(sql);
            pre.setString(1,email);
            pre.setString(2,password);
            ResultSet rs = pre.executeQuery();
            
            while(rs.next()){
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
      return user;
    }
}
