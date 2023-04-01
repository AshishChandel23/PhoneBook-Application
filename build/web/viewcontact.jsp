<%-- 
    Document   : viewcontact
    Created on : 26-Mar-2023, 1:22:29 pm
    Author     : ASHISH KUMAR CHANDEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.*" %>
<%@page import="com.entity.*" %>
<%@page import="com.connection.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PhoneBook-App</title>
         <%@include file="component/allcss.jsp" %>
         <style type="text/css">
        body{
            background-color:darkslategrey;
        }
    </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <%
            if(user==null){
            session.setAttribute("error","Please You have to login..");
            response.sendRedirect("login.jsp");
            }
            String saveMsg = (String)session.getAttribute("saveMsg");
            String errorMsg = (String)session.getAttribute("errorMsg");
            if(saveMsg!=null){
            %>
              <p class="text-info text-center" style="background-color:darkslategray; font-size: 1rem; border-radius:20px; border:3px solid #1c87c9;"><%=saveMsg%></p>
            <%
            session.removeAttribute("saveMsg");
            }
            if(errorMsg!=null){
            %>
            <p class="text-info text-center" style="background-color:darkslategray; font-size: 1rem; border-radius:20px; border:3px solid #1c87c9;"><%=errorMsg%></p>
             <%
            session.removeAttribute("errorMsg");
            }
            %>
        <div class="container">
            <div class="container mx-3 text-light">
                <div class="row">
                    <%
                        if(user!=null){
                        
                        ContactDao cd = new ContactDao(DBConnection.getConnect());
                        List<Contact> contacts = cd.getAllContacts(user.getId());
                        
                        for(Contact c : contacts){
                        %>
                        <div class="col-md-3 my-3">
                            <div class="card text-center" style=" width: 16rem; background-color: darkcyan; border-radius: 12px; border:3px solid #1c87c9;">
                                <div class="card-body text-light">
                                    <h5 class="card-title"><p class="text-light text-center"><i class="fa-solid fa-circle-info"></i> Info </p><p class="text-warning"><%=c.getName()%></p></h5>
                                  <h5 class="card-title">Phone: <%=c.getContact()%></h5>
                                  <h6 class="card-subtitle mb-2">Email : <%=c.getEmail()%></h6>
                                  <h6 class="card-title">About : <%=c.getAbout()%></h6>
                                  <a href="editcontact.jsp?cid=<%= c.getId()%>" class="btn btn-outline-info mx-3"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                                  <a href="delete?cid=<%= c.getId()%>" class="btn btn-outline-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                                 </div>
                            </div>
                        </div>
                        <%
                        }
                       }
                    %>
                </div>
            </div>
        </div>
        
    </body>
</html>
