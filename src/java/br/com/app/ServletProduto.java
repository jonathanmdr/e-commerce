package br.com.app;

import br.com.modelo.Produto;
import br.com.modelo.ProdutoDao;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
try {
            String buscaParam = request.getParameter("Buscar");

            Connection conexao = (Connection) request.getAttribute("conexao");
            ProdutoDao dao = new ProdutoDao(conexao);

            List<Produto> produtos = (List<Produto>) dao.consultaGeral();

            request.setAttribute("produtos", produtos);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensagem_erro", "Não foi possível carregar os dados.");
        }
        request.getRequestDispatcher("/WEB-INF/paginas/consulta.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*Create*/
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*Update*/
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*Delete*/
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
