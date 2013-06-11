<%-- 
    Document   : cadastrarGrupo
    Created on : 14/05/2013, 20:28:41
    Author     : oddy
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Grupo"%>
<%@page import="util.ControlaConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <title>Cadastrar Grupo</title>
    </head>
    <%        
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        Grupo c = new Grupo();
        GrupoDAO dao = new GrupoDAO(controlaConexao.getConexao());
    %>        
    <body>
        <h1>Cadastrar Grupo</h1>
        <form action='cadastrarGrupo.jsp'>
            <p>Grupo:
                <input type='text' name='grupo'/></p>
            
                <%                    
                    String p = request.getParameter("cadastrar");
                    
                    if (p != null) {
                        
                        c.setNome(request.getParameter("grupo"));
                        dao.inserir(c);
                        
                    }
                %>
            <input type='submit' name='cadastrar' value='Cadastrar'>
            <a href='pesquisarGrupo.jsp'><input type='button' name='cancelar' value='Cancelar'></a>
        </form>
    </body>

</html>
