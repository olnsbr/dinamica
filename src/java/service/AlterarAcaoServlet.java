/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AcaoDAO;
import excecao.BDException;
import excecao.ConexaoException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Acao;
import util.ControlaConexao;

/**
 *
 * @author oddy
 */
public class AlterarAcaoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ConexaoException, BDException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String p = request.getParameter("codigo");
        String sel = new String();
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        AcaoDAO aDAO = new AcaoDAO(controlaConexao.getConexao());
        Acao a = new Acao(Long.parseLong(p));
        a = aDAO.consultar(a);
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            
            out.println("<head>");
            
            out.println("<meta charset='utf-8'/>");
            out.println("<meta name='description' content='Teste Bootstrap'/>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'/>");
            out.println("<link href='paginas/css/bootstrap.css' rel='stylesheet' media='screen'/>");
            out.println("<link href='paginas/css/bootstrap-responsive.css' rel='stylesheet' media='screen'/>");
            out.println("<link href='paginas/css/estilo.css' rel='stylesheet' media='screen'/>");
            out.println("<title>Alterar Acao</title>");
            
            out.println("</head>");
            
            out.println("<body>");
            
            out.println("<div id='wrap'>");
            out.println("<div class='container-fluid'>");

            out.println("<div class='row-fluid'>");
            out.println("<div class='span12 topo'>");
            out.println("<h1 class='h1'>OF System</h1>");
            out.println("</div>");

            out.println("<div class='row-fluid'>");
            out.println("<div class=' row-fluid span12 corTopo'>");
            out.println("<ul class='nav nav-list'>");
            out.println("<li class='active'><a href='paginas/home.jsp'><i class='icon-home icon-white'></i> Início</a></li>");
            out.println("</ul>");
            out.println("</div>");
            out.println("</div>");

            out.println("<div class='row-fluid'>");
            out.println("<div class='span2'>");
//                            <!--conteúdo da lateral-->
            out.println("<div class='tabbable tabs-left'>");
            out.println("<ul class='nav nav-tabs'>");
            out.println("<li><a href='paginas/usuario/pesquisarUsuario.jsp' data-toggle='tab'><h4>Usuários</h4></a></li>");
            out.println("<li><a href='paginas/grupo/pesquisarGrupo.jsp' data-toggle='tab'><h4>Grupos</h4></a></li>");
            out.println("<li class='active'><a href='./pesquisarAcao' data-toggle='tab'><h4>Ações</h4></a></li>");
            out.println("</ul>");
            out.println("<div class='tab-content'>");

            out.println("</div>");
            out.println("</div>");
            out.println("</div>");

            out.println("<div class='span10'>");
//          <!--conteúdo do corpo-->
            out.println("<h2>Alterar Acao</h2>");

            out.println("<form name='alterarAcao' action='consultarAcao'>");

            out.println("<fieldset>");
            out.println("<label><b>Código:</b></label>");
            out.println("<span class ='input-xlarge uneditable-input'>" + a.getCodigo() + " </span><br/>");            
            out.println("<input type='hidden' name='codigo' value='"+a.getCodigo()+"'>");
            
            out.println("<label><b>Ação:</b></label>");
            out.println("<input type='text' name='nome' value='"+a.getDescricao()+"'/>");
            
            out.println("<label><b>Componente:</b></label>");
            out.println("<input type='text' name='componente' value='"+a.getComponente()+"'/>");
            out.println("</fieldset>"); 
            
            out.println("<input class='btn btn-warning' type='submit' name='alterar' value='Salvar'>");
            out.println("<a href='consultarAcao?codigo="+a.getCodigo()+"'><input class='btn' type='button' name='cancelar' value='Cancelar'</a>");
                        
            out.println("</form>");
            
            out.println("</div>");
            out.println("</div>");

            out.println("<div class='span12 topo'></div>");

            out.println("</div>");
            out.println("</div>");
            out.println("<div id='push'></div>");
            out.println("</div>");

            out.println("<div id='footer'>");
            out.println("<div class='container-fluid'>");
            out.println("<h4 class='h4'>@Todos os direitos reservados.</h4>");
            out.println("</div>");
            out.println("</div>");
            
            out.println("</body>");
            out.println("</html>");
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ConexaoException ex) {
            Logger.getLogger(AlterarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BDException ex) {
            Logger.getLogger(AlterarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ConexaoException ex) {
            Logger.getLogger(AlterarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BDException ex) {
            Logger.getLogger(AlterarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
