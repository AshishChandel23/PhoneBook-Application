/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.connection.DBConnection;
import com.dao.UserDao;
import com.entity.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author ASHISH KUMAR CHANDEL
 */
@WebServlet("/register")

public class RegisterServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User u = new User(name,email,password);
        
        UserDao ud = new UserDao(DBConnection.getConnect());
        boolean f = ud.userRegister(u);
        HttpSession session = request.getSession();
        if(f){
            session.setAttribute("sucssMsg","User SuccessFully Register....");
            response.sendRedirect("register.jsp");
            System.out.println("User SuccessFully Register....");
        }
        else{
            session.setAttribute("errorMsg","Somethong wrong in Server....");
            response.sendRedirect("register.jsp");
            System.out.println("Somethong wrong in Server....");
        }
    }
}
