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
        <title>Consultar Usuario</title>
    </head>
    <body>
        <h1>Consultar Usuario</h1>

        <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
        <jsp:useBean id = "user" class="modelo.Usuario"/>
        <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
        <jsp:useBean id = "grup" class="modelo.Grupo"/>

        <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>

        <jsp:setProperty name="controleUsuario" property="usuario" value="${controleUsuario.consultar(user)}"/>          

        <fieldset>
            <label for="codigo"><b>Codigo:</b></label><br/>
            ${controleUsuario.usuario.codigo}<br/>

            <label for="nome"><b>Nome:</b></label><br/>
            ${controleUsuario.usuario.nome} <br/>

            <label for="email"><b>Email:</b></label><br/>
            ${controleUsuario.usuario.email}<br/>

            <label for="telefone"><b>Telefone:</b></label><br/>
            ${controleUsuario.usuario.telefone}<br/>

            <label for="grupo"><b>Grupo:</b></label><br/>
            ${controleUsuario.usuario.grupo.nome}<br/>
        </fieldset> 

        <SCRIPT LANGUAGE="JavaScript">
            function cancelar() {
                window.location = "pesquisarUsuario.jsp";
            }
            function alterar(cod) {
                window.location = "alterarUsuario.jsp"+cod;
            }
            function alterarSenha() {
                window.location = "alterarSenhaUsuario.jsp?codigo=${usuario.codigo}";
            }
            function excluir() {
                window.location = "pesquisarUsuario.jsp";
            }
        </script>

        <input type='button' name='alterar' value='Alterar' onclick="alterar()">
        <input type='button' name='alterarSenha' value='Alterar Senha' onclick="alterarSenha()">
        <input type='submit' name='excluir' value='Excluir'>
        <input id="botaoCancelar" type="button" value="Cancelar" onClick="cancelar()">
        
    </body>
</body>
</html>
