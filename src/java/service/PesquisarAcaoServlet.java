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
public class PesquisarAcaoServlet extends HttpServlet {

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
            AcaoDAO aDAO = new AcaoDAO(controlaConexao.getConexao());
            List<Acao> listaA = new ArrayList();
            
            String p = request.getParameter("pesquisar");
            
            Acao ac = new Acao();
            
            if (p != null) {
                
                String c = request.getParameter("acao");
                ac.setDescricao(c);
                                
            }else{
                ac.setDescricao("");
            }
            
            listaA = aDAO.pesquisar(ac);           
                       
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PesquisarAcaoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Pesquisar Acao</h1>");
            out.println("<form name='pesquisarAcao' action='pesquisarAcao'>");
            out.println("<p>Acao:</p>");
            out.println("<input type='text' name='acao'/><br/>");
            out.println("<input type='submit' name='pesquisar' value='Pesquisar'>");
            out.println("</form>");
            out.println("<table border=1>");
            out.println("<tr><th>Codigo</th><th>Nome</th>");
            for (Acao acao : listaA) {
                
                out.println("<tr>");                
                out.println("<td>"+acao.getCodigo()+"</td>");                
                out.println("<td>"+"<a href='consultarAcao?codigo="+acao.getCodigo()+"'</a>"+acao.getDescricao()+"</td>");
            }
            out.println("</table><br/>");
            out.println("<form name='cadastros'>");
            out.println("<a href='cadastrarAcao'><input type='button' name='cadastrarAcao' value='Cadastrar Acao'></a>");
            out.println("<a href='./paginas/index.jsp'><input type='button' name='index' value='Cancelar'></a>");
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
            Logger.getLogger(PesquisarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BDException ex) {
            Logger.getLogger(PesquisarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PesquisarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BDException ex) {
            Logger.getLogger(PesquisarAcaoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
