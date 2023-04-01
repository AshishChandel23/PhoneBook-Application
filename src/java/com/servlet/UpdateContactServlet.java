/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.connection.DBConnection;
import com.dao.ContactDao;
import com.entity.Contact;
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
@WebServlet("/update")
public class UpdateContactServlet extends HttpServlet{

    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      int cid = Integer.parseInt(req.getParameter("cid"));
      String name = req.getParameter("name");
      String email = req.getParameter("email");
      String contact = req.getParameter("contact");
      String about = req.getParameter("about");
      
      //System.out.println(userId+" "+name+" "+email+" "+contact+" "+about);
      
      Contact c = new Contact();
      c.setId(cid);
      c.setName(name);
      c.setEmail(email);
      c.setContact(contact);
      c.setAbout(about);
      
      ContactDao cd = new ContactDao(DBConnection.getConnect());
      
      HttpSession session = req.getSession();
      boolean f = cd.updateContact(c);
      if(f==true){
          session.setAttribute("updateMsg","Contact Updated Successfully ");
          resp.sendRedirect("viewcontact.jsp");
      }
      else{
          session.setAttribute("errorMsg","Something Wrong on Server");
          resp.sendRedirect("editcontact.jsp?cid="+cid);
      }
    }
    
}
