<%-- 
    Document   : pesquisarUsuario
    Created on : 04/06/2013, 20:35:31
    Author     : Fran
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Pesquisar Usuario</title>
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
                                    <li><a href="../pesquisarAcao" data-toggle="tab"><h4>Ações</h4></a></li>
                                </ul>
                                <div class="tab-content">

                                </div>
                            </div>
                        </div>

                        <div class="span10">
                            <!--conteúdo do corpo-->
                            <h2>Pesquisar Usuario</h2>                    

                            <jsp:useBean id = "controle" class="controle.UsuarioControle"/>
                            <jsp:useBean id = "user" class="modelo.Usuario"/>

                            <form>
                                <fieldset name='pesquisarUsuario' action='pesquisarUsuario.jsp'>
                                    <label>Codigo:</label>
                                    <input type="text" name="codigo" value="${user.codigo}" maxlength="30" size="90"/>

                                    <label>Nome:</label>
                                    <input type="text" name="nome" value="${user.nome}" maxlength="30" size="90"/><br/>

                                    <label>Email:</label>
                                    <input type="text" name="email" value="${user.email}" maxlength="30" size="90"/><br/>   
                                </fieldset>
                                <input class="btn" type='submit' name='pesquisar' value='Pesquisar'>  
                            </form>                

                            <c:if test="${not empty param.pesquisar}">
                                <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>
                                <jsp:setProperty name="user" property="nome" value="${param.nome}"/>
                                <jsp:setProperty name="user" property="email" value="${param.email}"/>
                                <jsp:setProperty name="controle" property="usuario" value="${user}"/>
                                ${controle.pesquisar()}
                            </c:if>
                                
                            <c:if test="${not empty param.dell}">                               
                                
                                <jsp:setProperty name="user" property="codigo" value="${param.dell}"/>
                                ${controle.excluir(user)}
                                ${controle.pesquisar()}

                            </c:if>

                            <table class="table table-bordered">
                                <tr class="warning"><th>Codigo</th><th>Nome</th><th>Email</th><th>Grupo</th></tr>

                                <c:forEach var="usuario" items="${controle.usuarios}">

                                    <tr>
                                        <td>${usuario.codigo}</td>                     
                                        <td><a href="consultarUsuario.jsp?codigo=${usuario.codigo}"</a>${usuario.nome}</td>                     
                                        <td>${usuario.email}</td>
                                        <td>${usuario.grupo.nome}</td>
                                    </tr>

                                </c:forEach>            
                            </table>

                            <SCRIPT LANGUAGE="JavaScript">
                                function cadastrarUsuario() {
                                    window.location = "cadastrarUsuario.jsp";
                                }
                                function cancelar() {
                                    window.location = "../home.jsp";
                                }
                            </script>

                            <input class="btn" type="button" value="Cadastrar" onClick="cadastrarUsuario()">
                            <input class="btn" type="button" value="Cancelar" onClick="cancelar()">
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
