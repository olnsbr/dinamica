<%-- 
    Document   : cadastrarUsuario
    Created on : 04/06/2013, 21:16:17
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
        <title>Cadastrar Usuario</title>
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
                                    <li><a href="../../pesquisarAcao" data-toggle="tab"><h4>Ações</h4></a></li>
                                </ul>
                                <div class="tab-content">

                                </div>
                            </div>
                        </div>

                        <div class="span10">
                            <!--conteúdo do corpo-->
                            <h2>Cadastrar Usuario</h2>

                            <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
                            <jsp:useBean id = "user" class="modelo.Usuario"/>
                            <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
                            <jsp:useBean id = "grup" class="modelo.Grupo"/>

                            <form action='cadastrarUsuario.jsp'>
                                <fieldset>                
                                    <label>Nome:</label>
                                    <input type="text" placeholder="Digite seu nome..." name="nome" value="${user.nome}" maxlength="30" size="90"/><br/>

                                    <label>Email:</label>
                                    <input type="email" placeholder="email@email.com" name="email" value="${user.email}" maxlength="30" size="90"/><br/>

                                    <label>Telefone:</label>
                                    <input type="text" placeholder="(00) 9999-9999" name="telefone" value="${user.telefone}" maxlength="30" size="90"/><br/>

                                    <label>Grupo:</label>
                                    <select name='grupo'>

                                        <c:forEach var="grupo" items="${controleGrupo.grupos}">
                                            <option value="${grupo.codigo}">${grupo.nome}</option>
                                        </c:forEach>

                                    </select>
                                    <br/>

                                    <label>Senha:</label>
                                    <input type="password" name="senha" value="${user.senha}" maxlength="30" size="90"/><br/>

                                    <label>Confirmar Senha:</label>
                                    <input type="password" name="confSenha" maxlength="30" size="90"/><br/><%--ver esse negocio aqui depois--%>

                                </fieldset>  

                                <input class="btn" type='submit' name='salvar' value='Salvar'>

                                <SCRIPT LANGUAGE="JavaScript">
                                    function cancelar() {
                                        window.location = "pesquisarUsuario.jsp";
                                    }
                                </script>

                                <input class="btn" type="button" value="Cancelar" onClick="cancelar()">
                            </form>

                            <c:if test="${not empty param.salvar}">
                                <jsp:setProperty name="user" property="nome" value="${param.nome}"/>
                                <jsp:setProperty name="user" property="email" value="${param.email}"/>
                                <jsp:setProperty name="user" property="telefone" value="${param.telefone}"/>
                                <jsp:setProperty name="grup" property="codigo" value="${param.grupo}"/>
                                <jsp:setProperty name="user" property="grupo" value="${grup}"/>
                                <jsp:setProperty name="user" property="senha" value="${param.senha}"/>
                                <jsp:setProperty name="controleUsuario" property="usuario" value="${user}"/>

                                <%controleUsuario.cadastrar();%>
                            </c:if>
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
