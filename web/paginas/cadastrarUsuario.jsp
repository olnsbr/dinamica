<%-- 
    Document   : cadastrarUsuario
    Created on : 04/06/2013, 21:16:17
    Author     : Fran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Usuario</title>
    </head>
    <body>
        <h1>Cadastro de Usuario</h1>

        <jsp:useBean id = "controle" class="controle.UsuarioControle"/>
        <jsp:useBean id = "usuario" class="modelo.Usuario"/>
        <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
        <jsp:useBean id = "grupo" class="modelo.Grupo"/>
        
        
        <form action='cadastrarUsuario.jsp'>
            <fieldset>                
                <label for="nome">Nome:</label><br/>
                <input type="text" name="nome" value="${usuario.nome}" maxlength="30" size="90"/><br/>
                 
                <label for="email">Email:</label><br/>
                <input type="text" name="email" value="${usuario.email}" maxlength="30" size="90"/><br/>
                
                <label for="telefone">Telefone:</label><br/>
                <input type="text" name="telefone" value="${usuario.telefone}" maxlength="30" size="90"/><br/>
                
                <label for="grupo">Grupo:</label><br/>
                    <select name='grupo'>
                        
                        <c:forEach var="grupo" items="${controleGrupo.grupos}">
                            <option value="${grupo.codigo}">${grupo.nome}</option>
                        </c:forEach>
                        
                    </select>
                
                <label for="senha">Senha:</label><br/>
                <input type="password" name="senha" value="${usuario.senha}" maxlength="30" size="90"/><br/>
                
                <label for="confirma">Confirmar Senha:</label><br/>
                <input type="password" name="telefone" maxlength="30" size="90"/><br/><%--ver esse negocio aqui depois--%>
                
            </fieldset>
            
            <!--fazer o cadastro-->
            
            <input type='submit' name='salvar' value='Salvar'>
            <a href='pesquisarCidade.jsp'><input type='button' name='cancelar' value='Cancelar'></a>
        </form>
    </body>
</html>
