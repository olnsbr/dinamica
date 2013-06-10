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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <title>Alterar Usuario</title>
    </head>
    <body>
        <h1>Alterar Usuario</h1>

        <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
        <jsp:useBean id = "user" class="modelo.Usuario"/>
        <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
        <jsp:useBean id = "grup" class="modelo.Grupo"/>

        <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>

        <jsp:setProperty name="controleUsuario" property="usuario" value="${controleUsuario.consultar(user)}"/> 

        <form action='consultarUsuario.jsp'>
            <fieldset>

                <label for="codigo"><b>Codigo:</b></label><br/>
                ${controleUsuario.usuario.codigo}<br/>
                <input type="hidden" name="codigo" value="${controleUsuario.usuario.codigo}"/>

                <label for="nome">Nome:</label><br/>
                <input type="text" name="nome" value="${controleUsuario.usuario.nome}" maxlength="30" size="90"/><br/>

                <label for="email">Email:</label><br/>
                <input type="text" name="email" value="${controleUsuario.usuario.email}" maxlength="30" size="90"/><br/>

                <label for="telefone">Telefone:</label><br/>
                <input type="text" name="telefone" value="${controleUsuario.usuario.telefone}" maxlength="30" size="90"/><br/>

                <label for="grupo">Grupo:</label><br/>

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

            <input type='submit' name='alterar' value='Alterar'/>
            <input id="botaoCancelar" type="button" value="Cancelar" onClick="cancelar()"/> 
        </form>  


        <jsp:setProperty name="controleUsuario" property="usuario" value="${user}"/>



    </body>
</html>
