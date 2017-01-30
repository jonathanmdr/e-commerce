package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import br.com.controller.FilterProduto;
import br.com.DAO.ProdutoDAO;
import java.sql.ResultSet;
import br.com.controller.LoginController;

public final class CadastroProduto_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 if (LoginController.estaLogado(request)) { 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Manutenção de Produtos</title>\r\n");
      out.write("        <!-- CSS -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/reset.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/normalize.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/custom.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <nav class=\"navbar navbar-inverse\">\r\n");
      out.write("            <h1 style=\"text-align: center\"><span class=\"label label-danger\">Danger</span></h1>\r\n");
      out.write("            <ul class=\"nav navbar-nav\">\r\n");
      out.write("                <li class=\"active\"><a href=\"#\">Manutenção de produtos</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        ");

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
        
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"panel panel-danger\" style=\"width: 70%; position: absolute; left: 15%\">\r\n");
      out.write("            <div class=\"panel-heading\">Manutenção de produtos</div>\r\n");
      out.write("            <div class=\"panel-body\">\r\n");
      out.write("                <form action=\"ServletProdutoSalvar?id=");
      out.print(ident);
      out.write("&funcao=");
      out.print(request.getParameter("acao"));
      out.write("\" method=\"post\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"id\" value=\"");
      out.print( ident);
      out.write("\"/>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label>Descrição</label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"descricao\" value=\"");
      out.print(descricao);
      out.write("\" placeholder=\"Descrição do produto\"> <!--required=\"\" autofocus=\"\"-->\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label>Informação</label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"informacao\" value=\"");
      out.print(informacao);
      out.write("\" placeholder=\"Informação do produto\"> <!--required=\"\" autofocus=\"\"-->\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label>Valor</label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"valor\" value=\"");
      out.print(valor);
      out.write("\" placeholder=\"R$\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-default btn-lg\">\r\n");
      out.write("                        <span class=\"glyphicon glyphicon-floppy-disk\" aria-hidden=\"true\"></span> Gravar\r\n");
      out.write("                    </button>\r\n");
      out.write("                </form>\r\n");
      out.write("                <div style=\"text-align: right\">\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-default btn-lg\" onclick=\"location.href = 'ListagemProdutos.jsp'\">\r\n");
      out.write("                        <span class=\"glyphicon glyphicon-list-alt\" aria-hidden=\"true\"></span> Listagem de Produtos\r\n");
      out.write("                    </button> \r\n");
      out.write("                </div> <br/>\r\n");
      out.write("                 ");
 if (request.getAttribute("errMsg") != null && !request.getAttribute("errMsg").equals("")) { 
      out.write("\r\n");
      out.write("                <div class=\"alert alert-danger\">\r\n");
      out.write("                    <strong></strong> ");
      out.print( request.getAttribute("errMsg") );
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                ");
 } 
      out.write("   \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 } else {
        response.sendRedirect("LoginSenha.jsp?tela=1");
   }

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
