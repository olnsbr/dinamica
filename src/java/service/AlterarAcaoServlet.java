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
import java.util.ArrayList;
import java.util.List;
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
            out.println("<title>Servlet AlterarAcaoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Alterar Acao</h1>");
            out.println("<form name='alterarAcao' action='consultarAcao'>");
            out.println("<p>Código: "+a.getCodigo()+"</p>");
            out.println("<input type='hidden' name='codigo' value='"+a.getCodigo()+"'>");
            out.println("<p>Nome: ");
            out.println("<input type='text' name='nome' value='"+a.getDescricao()+"'/></p>");
            out.println("<p>Componente: ");
            out.println("<input type='text' name='componente' value='"+a.getComponente()+"'/></p>");               
            out.println("<input type='submit' name='alterar' value='Alterar'>");
            out.println("<a href='consultarAcao?codigo="+a.getCodigo()+"'><input type='button' name='cancelar' value='Cancelar'</a>");
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
