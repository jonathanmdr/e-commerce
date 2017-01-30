<%-- 
    Document   : CadastroProduto
    Created on : 10/10/2016, 23:19:13
    Author     : jonat_000
--%>
<%@page import="br.com.controller.FilterProduto"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="br.com.controller.LoginController" %>
<% if (LoginController.estaLogado(request)) { %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manutenção de Produtos</title>
        <!-- CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/custom.css">
        
        <style>
            body{
                background-image:url("img/background.jpg");
            }
            
            #lb{
               color: oldlace; 
               font-family: sans-serif;
               font-style: italic;
               font-size: 50px;
            }
            
            #li{
               color: white; 
               font-family: sans-serif;
               font-style: normal;
               font-size: 20px; 
            }
        </style>
    </head>
    <body>
        <nav style="background-color: #2b669a" class="navbar navbar-default">
            <h1 style="text-align: center"><span id="lb" class="label ">e-commerce - Cadastro de Produtos</span></h1>
            <ul class="nav navbar-nav">
                <li class="negative"><a id="li" href="index.jsp"><b>Inicio</b></a></li>
                <li><a id="li" href="LoginSenha.jsp"><b>Login</b></a></li>
            </ul>
        </nav>
        <div style="text-align: right; padding-top: 10px; padding-right: 200px;">
            <button type="submit" class="btn btn-default btn-lg" onclick="location.href = 'ListagemProdutos.jsp'">
                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Listagem de Produtos
            </button> 
        </div>
        <div style="padding-top: 10px;"></div> 

        <%
            String descricao = "";
            String informacao = "";
            String valor = "";
            String ident = "";

            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                ProdutoDAO produtodao = new ProdutoDAO();
                ResultSet rs = produtodao.consultarProdutosCodigo(Integer.parseInt(id));

                ident = id;

                rs.first();
                descricao = rs.getString("descricao");
                informacao = rs.getString("informacao");
                valor = rs.getString("valor");
            }
        %>

        <div class="panel panel-primary" style="width: 70%; position: absolute; left: 15%">                        
            <div class="panel-heading"><b>Produtos</b></div>
            <div class="panel-body">
                <form action="ServletProdutoSalvar?id=<%=ident%>&funcao=<%=request.getParameter("acao")%>" method="post">
                    <input type="hidden" name="id" value="<%=ident%>"/>
                    <div class="form-group">
                        <label>Descrição</label>
                        <input type="text" class="form-control" name="descricao" value="<%=descricao%>" placeholder="Descrição do produto"> <!--required="" autofocus=""-->
                    </div>
                    <div class="form-group">
                        <label>Informação</label>
                        <input type="text" class="form-control" name="informacao" value="<%=informacao%>" placeholder="Informação do produto"> <!--required="" autofocus=""-->
                    </div>
                    <div class="form-group">
                        <label>Valor</label>
                        <input type="text" class="form-control" name="valor" value="<%=valor%>" placeholder="R$">
                    </div>
                    <button type="submit" class="btn btn-default btn-lg">
                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Gravar
                    </button>
                </form>
                <% if (request.getAttribute("errMsg") != null && !request.getAttribute("errMsg").equals("")) {%>
                <div class="alert alert-warning">
                    <strong><%= request.getAttribute("errMsg")%></strong> 
                </div>
                <% } %>   
            </div>
        </div>
    </div>
</body>
</html>

<% } else {
        response.sendRedirect("LoginSenha.jsp?tela=1");
    }
%>