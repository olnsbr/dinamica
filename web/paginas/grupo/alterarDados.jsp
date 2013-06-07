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

        %>

        <form action="alterarDados.jsp">

            <p>Código: <%=grup.getCodigo()%></p>
            <p>Nome: <%=grup.getNome()%> </p>
            
            <input type="hidden" name="codigo" value="<%=grup.getCodigo() %>"
                   
            <p>Ação:
                <select name='acao'>
                    <%
                        String s = request.getParameter("adicionar");
                        String e = request.getParameter("exclur");
                        
                        if  (e != null){
                            
                                                        
                            
                        }
                        
                        
                        if (s != null) {

                            String aS = request.getParameter("acao");

                            acao.setCodigo(Long.parseLong(aS));

                            aDAO.adicionarGrupo(acao, grup);

                        }



                        List<Acao> todasAcoes = new ArrayList(aDAO.pesquisar(acao));
                        List<Acao> grupoAcoes = new ArrayList(aDAO.pesquisarAcaoGrupo(grup));
                        todasAcoes.removeAll(grupoAcoes);
                        for (Acao a : todasAcoes) {

                    %>

                    <option value='<%=a.getCodigo()%>'><%=a.getDescricao()%></option>


                    <%}%>
                </select><br/></p>


            <input type="submit" name="adicionar" value="Adicionar"/></form>
                
        <table border=1>
            <tr><th>Codigo</th><th>Nome</th>

                <%
                    List<Acao> lista = aDAO.pesquisarAcaoGrupo(grup);
                    for (Acao a : lista) {%>

            <tr>
                <td><%=a.getCodigo()%></td>
                <td><%=a.getDescricao()%></td>
            </tr>

            <%}%>            

        </table><br/>
        <form name="excluir">
        <select name="GrupoAcoes" multiple="multiple">
            
            <% 
                    
                    for (Acao a : grupoAcoes){%>
                        
                        <option value='<%=a.getCodigo()%>'><%=a.getDescricao()%></option>


                    <%}%>
                </select>
        
                <input type="submit" name="excluir" value="Excluir"/>
        </form>

    </body>
</html>
