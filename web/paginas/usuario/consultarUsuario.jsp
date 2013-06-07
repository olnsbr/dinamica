<%-- 
    Document   : consultarUsuario
    Created on : 07/06/2013, 00:08:53
    Author     : Fran
--%>

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
        
        <jsp:setProperty name="controleUsuario" property="usuario" value="${param.user}"/>


        ${controleUsuario.consultar(user)}

    <fieldset>                
        <label for="nome">Nome:</label><br/>
        ${user.nome}<br/>

        <label for="email">Email:</label><br/>
        ${user.email}<br/>

        <label for="telefone">Telefone:</label><br/>
        ${user.telefone}<br/>

        <label for="grupo">Grupo:</label><br/>
        ${user.grupo.nome}<br/>
    </fieldset>    

    <form name='consultarCidade' action='consultarCidade.jsp'>
        <input type='submit' name='excluir' value='Excluir'>
        <a href='pesquisarCidade.jsp'><input type='button' name='cancelar' value='Cancelar'</a>
    </form>
</body>
</body>
</html>
