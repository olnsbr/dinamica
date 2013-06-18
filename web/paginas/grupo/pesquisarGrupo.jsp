<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Grupo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.ControlaConexao"%>
<%@page import="dao.GrupoDAO"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>    
        <meta charset="utf-8"/>
        <meta name="description" content="Teste Bootstrap"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/bootstrap.css" rel="stylesheet" media="screen"/>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" media="screen"/>
        <link href="../css/estilo.css" rel="stylesheet" media="screen"/>
        <title>Pesquisar Grupo</title>
    </head>
    <body>
        <div id="wrap">
            <div class="container-fluid">

                <div class="row-fluid">
                    <div class="span12 topo">
                        <h1 class="h1">OF System</h1>
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
                            <h2>Pesquisar Grupo</h2>

                            <form name='pesquisarGrupo' action='pesquisarGrupo.jsp'>
                                <fieldset>
                                    <label>Codigo:</label>
                                    <input type="text" name="codigo"/>

                                    <label>Grupo:</label>
                                    <input type='text' name='grupo'/>
                                </fieldset>
                                <input class="btn btn-warning" type='submit' name='pesquisar' value='Pesquisar'> 
                            </form>

                            <%
                                ControlaConexao controlaConexao = new ControlaConexao("config.txt");
                                Grupo grup = new Grupo();
                                String p = request.getParameter("pesquisar");
                                if (p != null) {

                                    String c = request.getParameter("grupo");
                                    grup.setNome(c);
                                } else {
                                    grup.setNome("");
                                }
                                GrupoDAO cDAO = new GrupoDAO(controlaConexao.getConexao());
                                List<Grupo> lista = cDAO.pesquisar(grup);
                            %>

                            <table border=1 class="table table-bordered">
                                <tr><th>Codigo</th><th>Nome</th></tr>

                                <%
                                for (Grupo c : lista) {%>

                                <tr>
                                    <td><%=c.getCodigo()%></td>
                                    <td><a href='consultarGrupo.jsp?codigo=<%=c.getCodigo()%>'> <%=c.getNome()%> </a></td>
                                </tr>

                                <%}%>            

                            </table><br/>

                            <SCRIPT LANGUAGE="JavaScript">
                                function cadastrarGrupo() {
                                    window.location = "cadastrarGrupo.jsp";
                                }
                                function cancelar() {
                                    window.location = "../home.jsp";
                                }
                            </script>

                            <input class="btn btn-warning" type="button" value="Cadastrar" onClick="cadastrarGrupo()"/>
                            <input class="btn" type="button" value="Cancelar" onClick="cancelar()"/>

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
