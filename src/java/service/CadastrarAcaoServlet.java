package service;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Acao;
import util.ControlaConexao;
import dao.AcaoDAO;
import excecao.BDException;
import excecao.ConexaoException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class CadastrarAcaoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter saida = response.getWriter();
        
        try {
            ControlaConexao controlaConexao = new ControlaConexao("config.txt");
            Acao a = new Acao();

            AcaoDAO dao = new AcaoDAO(controlaConexao.getConexao());
            
            saida.println("<html>");
            saida.println("<head>");
            saida.println("<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>");
            saida.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/estilo.css\">");
            saida.println("<title>Titulo da Página</title>");
            saida.println("</head>");
            saida.println("<body>");
            saida.println("<h1>Cadastrar Acao</h1>");
            saida.println("<form action='cadastrarAcao'>");

            saida.println("<p>Acao:");
            saida.println("<input type='text' name='acao'/></p>");
            saida.println("<p>Componente:");
            saida.println("<input type='text' name='componente'/></p>");
            
            
            
            saida.println("<input type='submit' name='cadastrar' value='Cadastrar'>"); 
            saida.println("<a href='pesquisarAcao'><input type='button' name='cancelar' value='Cancelar'></a>"); 
            saida.println("</form>");
            saida.println("</body>");
            saida.println("</html>");
            
            String p = request.getParameter("cadastrar");
            
            if (p != null) {
                
                a.setDescricao(request.getParameter("acao"));
                a.setComponente(request.getParameter("componente"));
                dao.inserir(a);
                
            }

        } catch (ConexaoException | BDException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
