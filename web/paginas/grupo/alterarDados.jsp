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
        <meta charset="utf-8"/>
        <meta name="description" content="Teste Bootstrap"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/bootstrap.css" rel="stylesheet" media="screen"/>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" media="screen"/>
        <link href="../css/estilo.css" rel="stylesheet" media="screen"/>
        <title>Ações do Grupo</title>
    </head>

    <body>
        <div id="wrap">
            <div class="container-fluid">

                <div class="row-fluid">
                    <div class="span12 topo">
                        <h1 class="h1">CRUDY!</h1>
                    </div>

                    <div class="row-fluid">
                        <div class=" row-fluid span12 corTopo">
                            <ul class="nav nav-list">
                                <li class="active"><a href="../home.jsp"><i class="icon-home icon-white"></i> Início</a></li>                            
                            </ul>                    
                        </div>                    
                    </div>

                    <div class="row-fluid">
                        <div class="span2">
                            <!--conteúdo da lateral-->
                            <div class="tabbable tabs-left">
                                <ul class="nav nav-tabs">
                                    <li><a href="../usuario/pesquisarUsuario.jsp" data-toggle="tab"><h4>Usuários</h4></a></li>
                                    <li class="active"><a href="../grupo/pesquisarGrupo.jsp" data-toggle="tab"><h4>Grupos</h4></a></li>
                                    <li><a href="../../pesquisarAcao" data-toggle="tab"><h4>Ações</h4></a></li>
                                </ul>
                                <div class="tab-content">

                                </div>
                            </div>
                        </div>

                        <div class="span10">
                            <!--conteúdo do corpo-->
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
                                <fieldset>
                                    <label><b>Codigo:</b></label>
                                    <span class="input-xlarge uneditable-input"><%=grup.getCodigo()%></span><br/>
                                    <input type="hidden" name="codigo" value="<%=grup.getCodigo()%>"/>

                                    <label>Nome:</label>
                                    <span class="input-xlarge uneditable-input"><%=grup.getNome()%></span><br/>
                                    <input type="hidden" name="nome" value="<%=grup.getNome()%>"/><br/>

                                    <%
                                        if (e != null) {
                                            acao.setCodigo(Long.parseLong(e));
                                            aDAO.removerGrupo(acao, grup);
                                        }

                                        if (s != null) {
                                            String aS = request.getParameter("acao");
                                            acao.setCodigo(Long.parseLong(aS));
                                            aDAO.adicionarGrupo(acao, grup);
                                        }
                                    %>

                                    <label>Ação:</label>
                                    <select name='acao'>
                                        <%
                                            List<Acao> todasAcoes = new ArrayList(aDAO.pesquisar(acao));
                                            List<Acao> grupoAcoes = new ArrayList(aDAO.pesquisarAcaoGrupo(grup));
                                            todasAcoes.removeAll(grupoAcoes);

                                            for (Acao a : todasAcoes) {
                                        %>

                                        <option value='<%=a.getCodigo()%>'><%=a.getDescricao()%></option>

                                        <%}%>
                                    </select><br/>
                                </fieldset>
                                <input class="btn" type="submit" name="adicionar" value="Adicionar"/>
                            </form>

                            <form name="excluir" action="alterarDados.jsp">
                                <select name="codacao" size="5">
                                    <%
                                        for (Acao a : grupoAcoes) {%>

                                        <option value='<%=a.getCodigo()%>'><%=a.getDescricao()%></option>
                                    <%}%>
                                </select>

                                <input class="btn" type="submit" name="excluir" value="Excluir"/>
                                <input class="btn" type="hidden" name="codigo" value="<%=grup.getCodigo()%>"/>
                            </form>
                            <a href='consultarGrupo.jsp?codigo=<%=grup.getCodigo()%> '> <input class="btn" type='button' name='cancelar' value='Cancelar'</a>
                        </div>
                    </div>

                    <div class="span12 topo"></div>

                </div>
            </div>
            <div id="push"></div> 
        </div>

        <div id="footer">
            <div class="container-fluid">
                <h4 class="h4">@Todos os direitos reservados.</h4>
            </div>
        </div>
    </body>
</html>
