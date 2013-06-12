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
        <meta charset="utf-8"/>
        <meta name="description" content="Teste Bootstrap"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/bootstrap.css" rel="stylesheet" media="screen"/>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" media="screen"/>
        <link href="../css/estilo.css" rel="stylesheet" media="screen"/>
        <title>Alterar Grupo</title>
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
                            <h2>Alterar Grupo</h2>

                            <form name='alterarGrupo.jsp' action='consultarGrupo.jsp'>
                                <%
                                    String p = request.getParameter("codigo");
                                    ControlaConexao controlaConexao = new ControlaConexao("config.txt");
                                    GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
                                    Grupo c = new Grupo(Long.parseLong(p));
                                    c = cDAO.consultarPorCodigo(c);
                                %>

                                <fieldset>
                                    <label><b>Codigo:</b></label>
                                    <span class="input-xlarge uneditable-input"><%=c.getCodigo()%></span><br/>
                                    <input type="hidden" name="codigo" value="<%=c.getCodigo()%>"/>

                                    <label>Nome:</label>
                                    <input type="text" name="nome" value="<%=c.getNome()%>"/><br/>
                                </fieldset>

                                <input class="btn" type='submit' name='alterar' value='Alterar'>
                                <a href='consultarGrupo.jsp?codigo=<%=c.getCodigo()%> '> <input class="btn" type='button' name='cancelar' value='Cancelar'</a>
                            </form>
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
