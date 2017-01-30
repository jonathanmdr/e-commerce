<%-- 
    Document   : ListagemProdutos
    Created on : 10/10/2016, 23:19:13
    Author     : jonat_000
--%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.com.modelo.Produto"%>
<%@page import="br.com.controller.LoginController"%>

<% if (LoginController.estaLogado(request)) { %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
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

    <nav style="background-color: #2b669a" class="navbar navbar-default">
        <h1 style="text-align: center"><span id="lb" class="label">e-commerce - Lista de Produtos</span></h1>
        <ul class="nav navbar-nav">
            <li><a id="li" href="index.jsp"><b>Inicio</b></a></li>
            <li><a id="li" href="LoginSenha.jsp"><b>Login</b></a></li>
        </ul>
    </nav> 

    <div style="text-align: right; padding-top: 10px; padding-right: 135px;">
        <button type="submit" class="btn btn-default btn-lg" onclick="location.href = 'CadastroProduto.jsp?acao=cadastrar'">
            <span class="glyphicon glyphicon-file" aria-hidden="true"></span> Cadastrar Produto
    </div> <br/>   

    <div class="panel panel-primary" style="width: 80%; position: absolute; left: 10%">
        <%if (request.getAttribute("ok") != null && !request.getAttribute("ok").equals("")) {%>
        <div class="alert alert-success">
            <strong><%= request.getAttribute("ok")%></strong> 
        </div>
        <%}%>
        <div class="panel-heading"><b>Produtos</b></div>
        <table class="table table-striped table-condensed table-bordered">
            <tr>
                <th><b>Descrição</b></th> <th><b>Informação</b></th> <th><b>Valor</b></th> <th><b>Alterar</b></th> <th><b>Remover</b></th>  
            </tr>
            <%
                ProdutoDAO produtodao = new ProdutoDAO();
                ResultSet rs = produtodao.consultarProdutos();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String descricao = rs.getString("descricao");
                    String informacao = rs.getString("informacao");
                    String valor = rs.getString("valor");
            %>
            <tr> 
                <td><%=descricao%></td> 
                <td><%=informacao%></td> 
                <td><%=valor%></td>
                <td> 
                    <a href = "CadastroProduto.jsp?id=<%=id%>&acao=atualizar"> 
                        <button type="submit" class="btn btn-blok btn-warning"> 
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                        </button> 
                    </a>
                </td>
                <td> 
                    <a href = "ServletProduto?id=<%=id%>">   
                        <button type="submit" class="btn btn-blok btn-danger">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        </button>
                    </a>
                </td>
            </tr>
            </tr>
            <%}%>
        </table>
    </div> 
</html>

<% } else {
        response.sendRedirect("LoginSenha.jsp");
    }
%>
