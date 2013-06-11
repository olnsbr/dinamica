<%-- 
    Document   : alterarUsuario
    Created on : 07/06/2013, 14:16:03
    Author     : Fran
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Alterar Usuario</title>
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
                                    <li class="active"><a href="../usuario/pesquisarUsuario.jsp" data-toggle="tab"><h4>Usuários</h4></a></li>
                                    <li><a href="../grupo/pesquisarGrupo.jsp" data-toggle="tab"><h4>Grupos</h4></a></li>
                                    <li><a href="#tab2" data-toggle="tab"><h4>Ações</h4></a></li>
                                </ul>
                                <div class="tab-content">

                                </div>
                            </div>
                        </div>

                        <div class="span10">
                            <!--conteúdo do corpo-->
                            <h2>Alterar Usuario</h2>

                            <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
                            <jsp:useBean id = "user" class="modelo.Usuario"/>
                            <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
                            <jsp:useBean id = "grup" class="modelo.Grupo"/>

                            <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>

                            <jsp:setProperty name="controleUsuario" property="usuario" value="${controleUsuario.consultar(user)}"/> 

                            <form action='consultarUsuario.jsp'>
                                <fieldset>
                                    <label><b>Codigo:</b></label>
                                    <span class="input-xlarge uneditable-input">${controleUsuario.usuario.codigo}</span><br/>
                                    <input type="hidden" name="codigo" value="${controleUsuario.usuario.codigo}"/>

                                    <label>Nome:</label>
                                    <input type="text" name="nome" value="${controleUsuario.usuario.nome}" maxlength="30" size="90"/><br/>

                                    <label>Email:</label>
                                    <input type="email" name="email" value="${controleUsuario.usuario.email}" maxlength="30" size="90"/><br/>

                                    <label>Telefone:</label>
                                    <input type="text" name="telefone" value="${controleUsuario.usuario.telefone}" maxlength="30" size="90"/><br/>

                                    <label>Grupo:</label>
                                    <select name='grupo'> 
                                        <c:forEach var="grupo" items="${controleGrupo.grupos}">

                                            <c:if test="${grupo.codigo == controleUsuario.usuario.grupo.codigo}">

                                                <option value="${grupo.codigo}" selected="true">${grupo.nome}</option>    

                                            </c:if>

                                            <option value="${grupo.codigo}" sel>${grupo.nome}</option>
                                        </c:forEach>
                                    </select>

                                </fieldset>

                                <SCRIPT LANGUAGE="JavaScript">
                                    function cancelar() {
                                        window.location = "consultarUsuario.jsp?codigo=${controleUsuario.usuario.codigo}";
                                    }
                                </script>

                                <input class="btn" type='submit' name='alterar' value='Alterar'/>
                                <input class="btn" type="button" value="Cancelar" onClick="cancelar()"/> 
                            </form> 

                            <jsp:setProperty name="controleUsuario" property="usuario" value="${user}"/>

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
