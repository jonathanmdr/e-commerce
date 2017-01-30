<%-- 
    Document   : LoginSenhajsp
    Created on : 01/10/2016, 11:21:45
    Author     : jonat_000
--%>

<%@page import="br.com.app.ServletLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/custom.css">
        
        <style>
            body{
                background-image:url("img/backlogin.jpg");
                background-size: cover;
            }
            
            #lb{
               color: cadetblue; 
               font-family: sans-serif;
               font-style: italic;
               font-size: 50px;
            }
        </style>
    </head>
    <body>
        <nav>
            <h1 style="text-align: center"><span id="lb" class="label">e-commerce - Login</span></h1>
            <ul class="nav navbar-nav">
                <li class="negative"><a href="#"><b></b></a></li>
            </ul>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <div>
                        <img class="profile-img" src="img/login.jpg" alt="">
                        <form class="form-signin" action="ServletLogin?tela=<%=request.getParameter("tela")%>" method="post">
                            <input type="text" class="form-control" name="usuario" placeholder="Usuário" required autofocus>
                            <input type="password" class="form-control" name="senha" placeholder="Senha" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button> </br>
                     
                            <% if (request.getAttribute("erro") != null && !request.getAttribute("erro").equals("")) {%>
                            <div class="alert alert-warning">
                                <strong><%= request.getAttribute("erro")%></strong> 
                            </div>
                            <% }%>  
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
