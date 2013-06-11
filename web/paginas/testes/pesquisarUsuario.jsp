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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <title>Pesquisar Usuario</title>
    </head>

    <body>
        
            <h1 class="text-left">Pesquisar Usuario</h1>
        

        <jsp:useBean id = "controle" class="controle.UsuarioControle"/>
        <jsp:useBean id = "user" class="modelo.Usuario"/>

        <div id="conteudo">

            <form name='pesquisarUsuario' action='pesquisarUsuario.jsp'>
                <fieldset>                
                    <label for="nome">Codigo:</label><br/>
                    <input id="inputTexto" type="text" name="codigo" value="${user.codigo}" maxlength="30" size="90"/><br/>

                    <label for="email">Nome:</label><br/>
                    <input id="inputTexto" type="text" name="nome" value="${user.nome}" maxlength="30" size="90"/><br/>

                    <label for="assunto">Email:</label><br/>
                    <input id="inputTexto" type="text" name="email" value="${user.email}" maxlength="30" size="90"/><br/>               
                </fieldset>

                <input id="inputBotaoForm" type='submit' name='pesquisar' value='Pesquisar'>
                <br><br/>
            </form>                 

            <c:if test="${not empty param.pesquisar}">

                <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>
                <jsp:setProperty name="user" property="nome" value="${param.nome}"/>
                <jsp:setProperty name="user" property="email" value="${param.email}"/>
                <jsp:setProperty name="controle" property="usuario" value="${user}"/>
                ${controle.pesquisar()}

            </c:if>            

            <table border=1>
                <tr><th>Codigo</th><th>Nome</th><th>Email</th><th>Grupo</th></tr>

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
            </script>

            <input id="inputBotao" type="button" value="Cadastrar" onClick="cadastrarUsuario()">
            <a href='../index.jsp'><input type='button' name='index' value='Cancelar'></a>

        </div>

        <div id="rodape">
            <h4>@Todos os direitos reservados.</h4>
        </div>
    </body>
</html>
