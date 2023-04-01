<%-- 
    Document   : index.jsp
    Created on : 26-Mar-2023, 1:19:21 pm
    Author     : ASHISH KUMAR CHANDEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="com.connection.*" %>
<%@page import="com.entity.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PhoneBookApp</title>
        <%@include file="component/allcss.jsp"%>
    </head>
    <style type="text/css">
        body{
            background-color:darkslategrey;
    }
        .div-color{
            background-image:url('boy.jpg');
            /*background-color: darkcyan;*/
            background-size: cover;
            border-radius: 15px;
            width: 800rem;
            height: 32rem;
            padding: 2rem;
            text-align: center;
            object-fit: contain;
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
    <body> 
        <%@include file="component/navbar.jsp" %>
        <div class="container p-3">
            <div class="container mx-3 text-light div-color">
            <h1>Welcome To PhoneBook </h1>
        </div>
        </div>
        
        
    </body>
</html>
