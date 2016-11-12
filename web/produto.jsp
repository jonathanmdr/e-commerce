<%-- 
    Document   : produto
    Created on : 24/10/2016, 21:18:47
    Author     : jonat_000
--%>

<%@page import="br.com.conexao.ConnectionMySQL"%>
<%@page import="br.com.app.ListProdutos"%>
<%@page import="br.com.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mensagemErro = (String) request.getAttribute("mensagem_erro");
    List<Produto> produtos = (List<Produto>) ConnectionMySQL.statement;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produto JSP</title>
    </head>
    <body>
        <form method="POST" action="Produto">
            <label>Busca:</label>
            <input type="text" name="busca" value="">
            <input type="submit" value="Buscar">
        

        <table border="1">
            <tr>
                <th colspan="2">Produto </th>
                <th>Informação </th>
                <th>Quantidade </th>
                <th>Valor </th>
            </tr>

            <%
                if (ListProdutos.produtos != null) {
                    for (Produto prod : ListProdutos.produtos) {
            %>

            <tr>
                <td><%= prod.getDescricao()%></td>
                <td><%= prod.getInformacao()%></td>
                <td><%= prod.getQuantidade()%></td>
                <td><%= prod.getValor()%></td>
            </tr>

            <%
                  }
                }
            %>

        </table>
        </form>
    </body>
</html>
