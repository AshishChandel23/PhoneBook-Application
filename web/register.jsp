<%-- 
    Document   : register
    Created on : 26-Mar-2023, 1:22:01 pm
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
                 <h1><i class="fa-solid fa-id-card"></i> Register</h1>
            <div class="col">
            </div>
            <div class="col-4">
                <%
                    String sucssMsg = (String)session.getAttribute("sucssMsg");
                    String errorMsg = (String)session.getAttribute("errorMsg");
                    if(sucssMsg!=null){
                %>
                    <p class="text-warning text-center" style="background-color:darkslategray; border-radius:20px;"><%=sucssMsg%></p>
                <%
                    session.removeAttribute("sucssMsg");
                    }
                    if(errorMsg!=null){
                %>
                    <p class="text-warning text-center" style="background-color:darkslategray; border-radius:20px;"><%=errorMsg%></p>
                <%
                    session.removeAttribute("errorMsg");
                    }
                %>
                <form action="register" method="post">
                 <div class="form-group">
                  <label for="exampleInputEmail1">Enter Name</label>
                  <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group my-2">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group my-2">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group text-center">
                <button type="submit" class="btn btn-danger  my-3"><i class="fa-solid fa-id-card"></i> Register</button> 
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
