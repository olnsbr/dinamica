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
public class ConsultarAcaoServlet extends HttpServlet {

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
        try {
            ControlaConexao controlaConexao = new ControlaConexao("config.txt");
            String p = request.getParameter("codigo");
            AcaoDAO aDAO = new AcaoDAO(controlaConexao.getConexao());
            Acao ac = aDAO.consultar(new Acao(Long.parseLong(p)));
            
            String s = request.getParameter("alterar");
            if (s != null) {
                
                Acao a = new Acao();
                
                a.setCodigo(ac.getCodigo());
                a.setDescricao(request.getParameter("nome"));
                a.setComponente(request.getParameter("componente"));
                aDAO.alterar(a);
                ac = aDAO.consultar(a);
                
            }
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultarAcaoServlet</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/estilo.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Consultar Acao</h1>");
            out.println("<p>Código: "+ac.getCodigo()+"</p>");
            out.println("<p>Nome: "+ac.getDescricao()+"</p>");
            out.println("<p>Componente: "+ac.getComponente()+"</p>");
            out.println("<form name='consultarAcao' action='consultarAcao'>");
            out.println("<a href='alterarAcao?codigo="+ac.getCodigo()+"'><input type='button' name='alterar' value='Alterar'></a>");
            out.println("<input type='submit' name='excluir' value='Excluir'>");
            out.println("<a href='pesquisarAcao'><input type='button' name='cancelar' value='Cancelar'</a>");
            out.println("</form>");
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
            Logger.getLogger(ConsultarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BDException ex){
            Logger.getLogger(ConsultarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConsultarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BDException ex){
            Logger.getLogger(ConsultarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
