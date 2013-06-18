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

public class CadastrarAcaoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            ControlaConexao controlaConexao = new ControlaConexao("config.txt");
            Acao a = new Acao();

            AcaoDAO dao = new AcaoDAO(controlaConexao.getConexao());
            
            out.println("<html>");
            
            out.println("<head>");
            
            out.println("<meta charset='utf-8'/>");
            out.println("<meta name='description' content='Teste Bootstrap'/>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'/>");
            out.println("<link href='paginas/css/bootstrap.css' rel='stylesheet' media='screen'/>");
            out.println("<link href='paginas/css/bootstrap-responsive.css' rel='stylesheet' media='screen'/>");
            out.println("<link href='paginas/css/estilo.css' rel='stylesheet' media='screen'/>");
            out.println("<title>Cadastrar Acao</title>");
           
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
            out.println("<h2>Cadastrar Ação</h2>");

            out.println("<form action='cadastrarAcao'>");
            
            out.println("<fieldset>");
            out.println("<label>Ação:</label>");
            out.println("<input type='text' name='acao'/>");
            
            out.println("<label>Componente:</label>");
            out.println("<input type='text' name='componente'/>");
            out.println("</fieldset>");           
            
            out.println("<input class='btn btn-warning' type='submit' name='cadastrar' value='Salvar'>"); 
            out.println("<a href='pesquisarAcao'><input class='btn' type='button' name='cancelar' value='Cancelar'></a>"); 
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
            
            String p = request.getParameter("cadastrar");
            
            if (p != null) {
                
                out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
                out.println("alert('Registro incluído com sucesso!');");
                out.println("</script>");
                
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
