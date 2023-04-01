<%-- 
    Document   : addcontact
    Created on : 26-Mar-2023, 1:22:38 pm
    Author     : ASHISH KUMAR CHANDEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        .div-color{
            background-color: darkcyan;
            border-radius: 15px;
            width: 800rem;
            height: 32rem;
            padding: 2rem;
            font-size: 1.5rem;
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
        %>
        <div class="container p-3">
            <div class="container mx-3 text-light div-color">
                <div class="row">
                 <h3><i class="fa-solid fa-id-card"></i> Add Contact To PhoneBook</h3>
            <div class="col">
                 <%
                    String saveMsg = (String)session.getAttribute("saveMsg");
                    String errorMsg = (String)session.getAttribute("errorMsg");
                    if(saveMsg!=null){
                %>
                    <p class="text-info text-center" style="background-color:darkslategray; border-radius:20px;"><%=saveMsg%></p>
                <%
                    session.removeAttribute("saveMsg");
                    }
                    if(errorMsg!=null){
                %>
                    <p class="text-info text-center" style="background-color:darkslategray; border-radius:20px;"><%=errorMsg%></p>
                <%
                    session.removeAttribute("errorMsg");
                    }
                %>
            </div>
            <div class="col-4">
                <form action="contact" method="post">
                    <%
                    if(user!=null){
                    %>
                    <input type="hidden" value="<%= user.getId()%>" name="userid">
                    <%
                    }
                    %>
                 <div class="form-group">
                  <label for="exampleInputEmail1">Enter Name</label>
                  <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
                </div>
                <div class="form-group my-2">
                  <label for="exampleInputEmail1">Enter Email</label>
                  <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address">
                </div>
                <div class="form-group my-2">
                  <label for="exampleInputEmail1">Contact Number</label>
                  <input type="number" name="contact" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Contact Number">
                </div>
                <div class="form-group my-2">
                <label for="exampleInputEmail1">About</label>
                <textarea class="form-control" name="about" id="exampleFormControlTextarea1" placeholder="Enter About" rows="2"></textarea>
                </div>
                <div class="form-group text-center">
                <button type="submit" class="btn btn-danger  my-2"><i class="fa-solid fa-id-card"></i> Save Contact</button> 
                </div>
            </form>
            </div>
            <div class="col">
            </div>
          </div>
        </div>
        </div>
        
    </body>
</html>
