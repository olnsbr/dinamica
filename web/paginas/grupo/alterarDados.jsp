<%-- 
    Document   : alterarDados
    Created on : 07/06/2013, 14:41:52
    Author     : oddy
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="modelo.Acao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AcaoDAO"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="util.ControlaConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <title>Ações do Grupo</title>
    </head>
    <body>
        <h1>Alterar Dados</h1>
        <h2>Ações do Grupo</h2>

        <%
            ControlaConexao controlaConexao = new ControlaConexao("config.txt");
            AcaoDAO aDAO = new AcaoDAO(controlaConexao.getConexao());
            Acao acao = new Acao("");
            String p = request.getParameter("codigo");
            GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
            Grupo grup = cDAO.consultarPorCodigo(new Grupo(Long.parseLong(p)));
            String s = request.getParameter("adicionar");
            String e = request.getParameter("codacao");


        %>

        <form action="alterarDados.jsp">

            <p>Código: <%=grup.getCodigo()%></p>
            <p>Nome: <%=grup.getNome()%> </p>

            <input type="hidden" name="codigo" value="<%=grup.getCodigo()%>"

                   <p>Ação:
                <select name='acao'>
                    <%
                        if (s != null) {

                            String aS = request.getParameter("acao");

                            acao.setCodigo(Long.parseLong(aS));

                            aDAO.adicionarGrupo(acao, grup);

                        }
                        
                        if (e != null) {

                            Acao ac = new Acao(Long.parseLong(e));

                            aDAO.removerGrupo(ac, grup);

                        }



                        List<Acao> todasAcoes = new ArrayList(aDAO.pesquisar(acao));
                        List<Acao> grupoAcoes = new ArrayList(aDAO.pesquisarAcaoGrupo(grup));
                        todasAcoes.removeAll(grupoAcoes);

                        if (todasAcoes.size() == 0) {

                    %>

                    <option value="0" disabled="true">Nenhuma Disponível</option>


                    <%                        }
                        for (Acao a : todasAcoes) {

                    %>

                    <option value='<%=a.getCodigo()%>'><%=a.getDescricao()%></option>


                    <%}%>
                </select></p><br/>
            <input type="submit" name="adicionar" value="Adicionar"/></form>
        <form name="excluir">
            <select name="codacao" size="5">

                <%

                    if (grupoAcoes.size() == 0) {

                %>

                <option value="0" disabled="true">Nenhuma Ação</option>


                <%                    }

                    for (Acao a : grupoAcoes) {%>

                <option value='<%=a.getCodigo()%>'><%=a.getDescricao()%></option>


                <%}%>
            </select>

            <input type="submit" name="excluir" value="Excluir"/>
            <input type="hidden" name="codigo" value="<%=grup.getCodigo()%>"/>
        </form>
        <a href='consultarGrupo.jsp?codigo=<%=grup.getCodigo()%> '> <input type='button' name='cancelar' value='Cancelar'</a>
    </body>
</html>
