<%-- 
    Document   : excluirGrupo
    Created on : 14/05/2013, 21:46:20
    Author     : oddy
--%>

<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="util.ControlaConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Servlet ExcluirGrupoServlet</title>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
    </head>
    <body>
        <h1>Exclur Grupo</h1>
        <%
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
        String p = request.getParameter("codigo");
        Grupo cid = new Grupo(Long.parseLong(p));
        cid = cDAO.consultarPorCodigo(cid);
        
        String s = request.getParameter("sim");
        if (s != null){
            
            cDAO.excluir(cid);
            response.sendRedirect("pesquisarGrupo.jsp");
        }  
        
        %>
        
        <p>Tem Certeza que deseja excluir a Grupo <%=cid.getNome()%>?</p>

        <form name='excluirGrupo'>
            <a href='excluirGrupo.jsp?codigo=<%=cid.getCodigo()%>&sim=true'> <input type='button' name='sim' value='Sim'></a>
            <a href='consultarGrupo.jsp?codigo=<%=cid.getCodigo()%>'> <input type='button' name='nao' value='Não'></a>
            <a href='pesquisarGrupo.jsp'><input type='button' name='cancelar' value='Cancelar'</a>
        </form>
    </body>

</html>
