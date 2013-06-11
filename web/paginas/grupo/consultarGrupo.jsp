<%-- 
    Document   : consultarGrupo
    Created on : 14/05/2013, 21:05:24
    Author     : oddy
--%>

<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="util.ControlaConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Servlet ConsultarGrupoServlet</title>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
    </head>
    <%

        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        String p = request.getParameter("codigo");
        GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
        Grupo grup = cDAO.consultarPorCodigo(new Grupo(Long.parseLong(p)));

        String s = request.getParameter("alterar");
        if (s != null) {

            Grupo c = new Grupo();

            c.setCodigo(grup.getCodigo());
            c.setNome(request.getParameter("nome"));
            cDAO.alterar(c);
            grup = cDAO.consultarPorCodigo(c);

        }

    %>
    <body>
        <h1>Consultar Grupo</h1>
        <p>Código: <%=grup.getCodigo()%> </p>
        <p>Nome: <%=grup.getNome()%> </p>
        <form name='consultarGrupo'>
            <a href='alterarGrupo.jsp?codigo=<%=grup.getCodigo()%>'> <input type='button' name='alterar' value='Alterar'></a>
            <a href='alterarDados.jsp?codigo=<%=grup.getCodigo()%>'> <input type='button' name='dados' value='Alterar Dados'></a>
            <a href='excluirGrupo.jsp?codigo=<%=grup.getCodigo()%>'> <input type='button' name='excluir' value='Excluir'></a>
            <a href='pesquisarGrupo.jsp'><input type='button' name='cancelar' value='Cancelar'></a>
        </form>
    </body>

</html>
