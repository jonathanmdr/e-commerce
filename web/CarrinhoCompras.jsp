<%-- 
    Document   : CarrinhoCompras
    Created on : 12/10/2016, 10:20:11
    Author     : jonat_000
--%>

<%@page import="br.com.app.ServletProdutoList"%>
<%@page import="br.com.modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho de Compras</title>
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
            <h1 style="text-align: center"><span id="lb" class="label">e-commerce - Carrinho de Compras</span></h1>
            <ul class="nav navbar-nav">
                <li><a id="li" href="index.jsp"><b>Inicio</b></a></li>
                <li><a id="li" href="LoginSenha.jsp"><b>Login</b></a></li>
            </ul>
        </nav>
        <div style="text-align: right; padding-top: 10px; padding-right: 70px;">
            <form action="ServletPedido" method="post">
                <button type="submit" class="btn btn-default btn-lg">
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Finalizar Compra
                </button>
            </form>    
        </div>
        <div style="padding-top: 10px;"></div>        
        <div class="panel panel-primary" style="width: 90%; position: absolute; left: 5%;">
            <div class="panel-heading"><b>Produtos no carrinho</b></div>
            <table class="table table-striped table-condensed table-bordered">

                <%
                    HttpSession sessao = request.getSession();
                    ArrayList<Produto> produtos = (ArrayList) sessao.getAttribute("produtos");
                    if (produtos != null) {
                %>
                <tr>
                    <th><b>Descrição</b></th> <th><b>Informação</b></th> <th><b>Valor</b></th> <th><b>Quantidade</b></th> <th><b>Sub-Total</b></th> <th><b>Remover</b></th> <th><b>Adicionar</b></th>
                </tr>
                <%
                    for (Produto p : produtos) {
                %>

                <tr>
                    <td><%= p.getDescricao()%></td> 
                    <td><%= p.getInformacao()%></td> 
                    <td><%= p.getValor()%></td> 
                    <td><%=p.getQuantidade()%></td>
                    <td><%= p.getValor() * p.getQuantidade()%></td>  
                    <td> 
                        <form action="ServletProdutoList?acao=remov&id=<%=p.getId()%>" method="post">
                            <button type="submit" class="btn btn-block btn-danger">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            </button>                                                       
                        </form>
                    </td>
                    <td>
                        <form action="ServletProdutoList?id=<%=p.getId()%>&acao=add" method="post">
                            <button type="submit" class="btn btn-block btn-primary"> 
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                        </form>
                    </td>
                </tr>
                <%}%> 
            </table>            
        </div>        
        <%} else {%>
        <br/><h2><b>Seu carrinho ainda está vazio!      =(</b></h2><br/>
        <%}%> 
    </body>
</html>
