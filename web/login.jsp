<%-- 
    Document   : login.jsp
    Created on : 26-Mar-2023, 1:21:51 pm
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
        <div class="container p-3">
            <div class="container mx-3 text-light div-color">
                <div class="row">
                 <h1><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</h1>
            <div class="col">
            </div>
            <div class="col-4">
                <form action="login" method="post">
                <div class="form-group my-2">
                    <%
                        String error = (String) session.getAttribute("error");
                        if(error!=null){
                        %>
                        <p class="text-warning text-center" style="background-color:darkslategray; border-radius:20px;"><%= error %></p>
                        <%
                            session.removeAttribute("error");
                        }
                    %>
                    <%
                        String logoutMsg = (String) session.getAttribute("logoutMsg");
                        if(logoutMsg!=null){
                        %>
                        <p class="text-warning text-center" style="background-color:darkslategray; border-radius:20px;" ><%= logoutMsg %></p>
                        <%
                            session.removeAttribute("logoutMsg");
                        }
                    %>
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group my-2">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group text-center">
                <button type="submit" class="btn btn-primary my-3 text-center"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</button>
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
