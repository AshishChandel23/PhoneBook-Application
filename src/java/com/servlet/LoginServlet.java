 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.connection.DBConnection;
import com.dao.UserDao;
import com.entity.User;
import jakarta.servlet.ServletException;
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
@WebServlet("/login")

public class LoginServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = (String) req.getParameter("email");
        String password =  (String) req.getParameter("password");
        UserDao ud = new UserDao(DBConnection.getConnect());
        User u = ud.userLogin(email,password);
        HttpSession session = req.getSession();
        if(u!=null){
            session.setAttribute("user",u);
            resp.sendRedirect("index.jsp");
            //System.out.println("User is Available "+u);
        }
        else{
            session.setAttribute("error","Invalid Email & Password");
            resp.sendRedirect("login.jsp");
            //System.out.println("User is not Available "+u);
        }
        
    }
    
}
