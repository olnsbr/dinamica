<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Grupo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.ControlaConexao"%>
<%@page import="dao.GrupoDAO"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <title>Servlet PesquisarGrupoServlet</title>
</head>
<body>
    <h1>Pesquisar Grupo</h1>
    <form name='pesquisarGrupo' action='pesquisarGrupo.jsp'>
        <p>Grupo:</p>
        <input type='text' name='grupo'/><br/>
        <input type='submit' name='pesquisar' value='Pesquisar'>
    </form>
    <%
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        Grupo grup = new Grupo();
        String p = request.getParameter("pesquisar");
        if (p != null) {
            
            String c = request.getParameter("grupo");
            grup.setNome(c);
        }else{grup.setNome("");
        }
        GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
        List<Grupo> lista = cDAO.pesquisar(grup);
    %>
    <table border=1>
        <tr><th>Codigo</th><th>Nome</th></tr>

            <%
                for (Grupo c : lista) {%>

        <tr>
            <td><%=c.getCodigo()%></td>
            <td><a href='consultarGrupo.jsp?codigo=<%=c.getCodigo()%>'> <%=c.getNome()%> </a></td>
        </tr>

            <%}%>            

    </table><br/>
    <form name='cadastros'>
        <a href='cadastrarGrupo.jsp'><input type='button' name='cadastrarGrupo' value='Cadastrar Grupo'></a>
    </form>
</body>

</html>
