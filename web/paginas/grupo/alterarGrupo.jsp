<%-- 
    Document   : alterarGrupo
    Created on : 14/05/2013, 21:23:46
    Author     : oddy
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="util.ControlaConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Servlet AlterarGrupoServlet</title>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
    </head>
    <body>
        <h1>Alterar Grupo</h1>
        <form name='alterarGrupo.jsp' action='consultarGrupo.jsp'>
            <%

                String p = request.getParameter("codigo");
                ControlaConexao controlaConexao = new ControlaConexao("config.txt");
                GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
                Grupo c = new Grupo(Long.parseLong(p));
                c = cDAO.consultarPorCodigo(c);

            %>
            <p>Código: <%=c.getCodigo()%></p>
            <input type='hidden' name='codigo' value='<%=c.getCodigo()%>'>
            <p>Nome: 
                <input type='text' name='nome' value='<%=c.getNome()%>'/></p>
            
            <input type='submit' name='alterar' value='Alterar'>
            <a href='consultarGrupo.jsp?codigo=<%=c.getCodigo()%> '> <input type='button' name='cancelar' value='Cancelar'</a>
        </form>
    </body>

</html>
