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
        <meta charset="utf-8"/>
        <meta name="description" content="Teste Bootstrap"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/bootstrap.css" rel="stylesheet" media="screen"/>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" media="screen"/>
        <link href="../css/estilo.css" rel="stylesheet" media="screen"/>
        <title>Excluir Grupo</title>
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
                            <h2>Excluir Grupo</h2>

                            <%
                                ControlaConexao controlaConexao = new ControlaConexao("config.txt");
                                GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
                                String p = request.getParameter("codigo");
                                Grupo cid = new Grupo(Long.parseLong(p));
                                cid = cDAO.consultarPorCodigo(cid);

                                String s = request.getParameter("sim");
                                if (s != null) {

                                    cDAO.excluir(cid);
                                    response.sendRedirect("pesquisarGrupo.jsp");
                                }
                            %>

                            <p>Tem Certeza que deseja excluir o Grupo <%=cid.getNome()%>?</p>
                            <p>Atenção! O grupo será excluido mesmo que tenha Ações associadas!!!</p>

                            <form name='excluirGrupo'>
                                <a href='excluirGrupo.jsp?codigo=<%=cid.getCodigo()%>&sim=true'> <input class="btn" type='button' name='sim' value='Sim'></a>
                                <a href='consultarGrupo.jsp?codigo=<%=cid.getCodigo()%>'> <input class="btn" type='button' name='nao' value='Não'></a>
                                <a href='pesquisarGrupo.jsp'><input class="btn" type='button' name='cancelar' value='Cancelar'</a>
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
