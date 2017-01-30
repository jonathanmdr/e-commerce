<%@page import="br.com.modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>E-Commerce</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- JS -->
        <script type="text/javascript" src="js/lib/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>

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
            <h1 style="text-align: center"><span id="lb" class="label">e-commerce</span></h1>
            <ul class="nav navbar-nav">
                <li><a id="li" href="#"><b>Inicio</b></a></li>
                <li><a id="li" href="LoginSenha.jsp"><b>Login</b></a></li>
                <li><a id="li" href="CadastroProduto.jsp"><b>Cadastro de Produtos</b></a></li> 
            </ul>               
            <div class="col-lg-6" style="width: 40%; position: absolute; left: 30%">
                <form action="ServletProdutoList?acao=pes" method="get">
                    <div class="input-group">  
                        <input type="text" class="form-control" name="pesquisa" placeholder="Digite o que está procurando..."/>
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </button>                           
                        </span>
                    </div>
                </form>
            </div>
            <div style="text-align: right; padding-top: 0px; padding-right: 10px;">
                <button type="submit" class="btn btn-danger" onclick="location.href = 'LoginSenha.jsp'">
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span> Sair
                </button>
            </div>
        </nav>
        </br>
        <%
            HttpSession sessao = request.getSession();
            ArrayList<Produto> produtos = (ArrayList) sessao.getAttribute("produtos");
            if (produtos != null) {
                for (Produto p : produtos){
                    int total =+ p.getQuantidade();                   
                }        
            } else {
            }
        %>
        <div style="text-align: right; padding-top: 8px; padding-right: 70px;">
                <button type="submit" class="btn btn-lg" onclick="location.href = 'CarrinhoCompras.jsp'">
                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Meu Carrinho <span class="badge"></span>
                </button>
        </div> </br>
        <div class="panel panel-primary" style="width: 90%; position: absolute; left: 5%">
            <%if (request.getAttribute("msg") != null && !request.getAttribute("msg").equals("")) {%>
            <div class="alert alert-success">
                <strong><%= request.getAttribute("msg")%></strong> 
            </div>
            <%}%>            
            <div class="panel-heading"><b>Produtos</b></div>
            <table class="table table-striped table-condensed table-bordered">

                <%
                    ProdutoDAO produtodao = new ProdutoDAO();

                    ResultSet rs = null;

                    if (request.getParameter("acao") == null || request.getParameter("acao").equals(null)) {
                        rs = produtodao.consultarProdutos();
                    } else {
                        rs = (ResultSet) request.getAttribute("pesquisas");
                    }

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
                    <td style="width: 5%"> 
                        <form action="ServletProdutoList?id=<%=id%>&acao=add" method="post">
                            <button type="submit" class="btn btn-block btn-success"> 
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b> Comprar</b>
                            </button>
                        </form>
                    </td>                
                </tr>
                <%}%>
            </table> 
        </div>

        <script type="text/javascript" src="js/app.js"></script>
    
</html>