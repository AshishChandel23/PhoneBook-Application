/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.connection.DBConnection;
import com.dao.ContactDao;
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
@WebServlet("/delete")
public class DeleteContactServlet extends HttpServlet{

    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid = Integer.parseInt(req.getParameter("cid"));
        ContactDao cd = new ContactDao(DBConnection.getConnect());
        
        HttpSession session = req.getSession();
        boolean f = cd.deleteContactById(cid);
        if(f==true){
            session.setAttribute("saveMsg","Contact Deleted Successfully ");
            resp.sendRedirect("viewcontact.jsp");
        }
        else{
            session.setAttribute("errorMsg","Something Wrong on Server");
            resp.sendRedirect("viewcontact.jsp");
        }
    } 
}
