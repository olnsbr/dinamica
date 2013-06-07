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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Usuario</title>
    </head>
    <body>
        <h1>Cadastro de Usuario</h1>

        <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
        <jsp:useBean id = "user" class="modelo.Usuario"/>
        <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
        <jsp:useBean id = "grup" class="modelo.Grupo"/>


        <form action='cadastrarUsuario.jsp'>
            <fieldset>                
                <label for="nome">Nome:</label><br/>
                <input type="text" name="nome" value="${user.nome}" maxlength="30" size="90"/><br/>

                <label for="email">Email:</label><br/>
                <input type="text" name="email" value="${user.email}" maxlength="30" size="90"/><br/>

                <label for="telefone">Telefone:</label><br/>
                <input type="text" name="telefone" value="${user.telefone}" maxlength="30" size="90"/><br/>

                <label for="grupo">Grupo:</label><br/>
                <select name='grupo'>

                    <c:forEach var="grupo" items="${controleGrupo.grupos}">
                        <option value="${grupo.codigo}">${grupo.nome}</option>
                    </c:forEach>

                </select>

                <label for="senha">Senha:</label><br/>
                <input type="password" name="senha" value="${user.senha}" maxlength="30" size="90"/><br/>

                <label for="confirma">Confirmar Senha:</label><br/>
                <input type="password" name="telefone" maxlength="30" size="90"/><br/><%--ver esse negocio aqui depois--%>

            </fieldset>                   

            <!--fazer o cadastro-->

            <input type='submit' name='salvar' value='Salvar'>

            <a href='pesquisarCidade.jsp'><input type='button' name='cancelar' value='Cancelar'></a>
    </form>

    <c:if test="${not empty param.salvar}">
        <jsp:setProperty name="controleUsuario" property="usuario.nome" value="${param.nome}"/>
        <jsp:setProperty name="controleUsuario" property="usuario.email" value="${param.email}"/>
        <jsp:setProperty name="controleUsuario" property="usuario.telefone" value="${param.telefone}"/>
        <jsp:setProperty name="controleUsuario" property="usuario.grupo.codigo" value="${param.grupo}"/>
        <jsp:setProperty name="controleUsuario" property="usuario.senha" value="${param.senha}"/>

        <%controleUsuario.cadastrar();%>

    </c:if>

</body>
</html>
