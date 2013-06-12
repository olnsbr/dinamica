<%-- 
    Document   : cadastrarGrupo
    Created on : 14/05/2013, 20:28:41
    Author     : oddy
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Grupo"%>
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
        <title>Cadastrar Grupo</title>
    </head>
    <%
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        Grupo c = new Grupo();
        GrupoDAO dao = new GrupoDAO(controlaConexao.getConexao());
    %>        
    <body>
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
                <h2>Cadastrar Grupo</h2>

                <form action='cadastrarGrupo.jsp'>
                    <fieldset>
                        <label>Grupo:</label>
                        <input type="text" name="grupo"/>

                        <%
                            String p = request.getParameter("cadastrar");

                            if (p != null) {
                        %>
                        <SCRIPT LANGUAGE="JavaScript">

                            alert("Registro incluído com sucesso!");

                        </script>
                        <%
                                c.setNome(request.getParameter("grupo"));
                                dao.inserir(c);
                            }
                        %>
                    </fieldset>

                    <SCRIPT LANGUAGE="JavaScript">
                        function cancelar() {
                            window.location = "pesquisarGrupo.jsp";
                        }
                    </script>

                    <input class="btn" type='submit' name='cadastrar' value='Cadastrar'>
                    <input class="btn" type="button" value="Cancelar" onClick="cancelar()"/>
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
