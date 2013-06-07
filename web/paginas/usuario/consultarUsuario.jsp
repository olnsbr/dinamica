<%-- 
    Document   : consultarUsuario
    Created on : 07/06/2013, 00:08:53
    Author     : Fran
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Usuario</title>
    </head>
    <body>
        <h1>Consulta de Usuario</h1>

        <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
        <jsp:useBean id = "user" class="modelo.Usuario"/>
        <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
        <jsp:useBean id = "grup" class="modelo.Grupo"/>
        
        <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>
        <jsp:setProperty name="controleUsuario" property="usuario" value="${controleUsuario.consultar(user)}"/>
                
        
        
        
    <fieldset>                
        <label for="nome"><b>Nome:</b></label><br/>
        ${controleUsuario.usuario.nome}<br/><br/>

        <label for="email"><b>Email:</b></label><br/>
        ${controleUsuario.usuario.email}<br/><br/>

        <label for="telefone"><b>Telefone:</b></label><br/>
        ${controleUsuario.usuario.telefone}<br/><br/>

        <label for="grupo"><b>Grupo:</b></label><br/>
        ${controleUsuario.usuario.grupo.nome}<br/><br/>
    </fieldset>    

    <form name='consultarCidade' action='consultarCidade.jsp'>
        <input type='submit' name='excluir' value='Excluir'>
        <a href='pesquisarCidade.jsp'><input type='button' name='cancelar' value='Cancelar'</a>
    </form>
</body>
</body>
</html>
