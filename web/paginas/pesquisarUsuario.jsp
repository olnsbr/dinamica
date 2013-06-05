<%-- 
    Document   : pesquisarUsuario
    Created on : 04/06/2013, 20:35:31
    Author     : Fran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <title>Pesquisa de Usuario</title>
    </head>
    <body>
        <div id="topo">
            <h1>Pesquisa de Usuario</h1>
        </div>

        <jsp:useBean id = "controle" class="controle.UsuarioControle"/>
        <jsp:useBean id = "usuario" class="modelo.Usuario"/>
        
        <div id="conteudo">

        <form name='pesquisarUsuario' action='pesquisarUsuario.jsp'>
            <fieldset>                
                <label for="nome">Codigo:</label><br/>
                <input id="inputTexto" type="text" name="codigo" value="${usuario.codigo}" maxlength="30" size="90"/><br/>
                
                <label for="email">Nome:</label><br/>
                <input id="inputTexto" type="text" name="nome" value="${usuario.nome}" maxlength="30" size="90"/><br/>
                 
                <label for="assunto">Email:</label><br/>
                <input id="inputTexto" type="text" name="email" value="${usuario.email}" maxlength="30" size="90"/><br/>               
            </fieldset>
            
            <input type='submit' name='pesquisar' value='Pesquisar'>
            <br><br/>
        </form>
            
            <c:if test="${not empty param.pesquisar}">                
                
                <jsp:setProperty name="usuario" property="codigo" value="${param.usuario}"/>
                <jsp:setProperty name="usuario" property="nome" value="${param.usuario}"/>
                <jsp:setProperty name="usuario" property="email" value="${param.usuario}"/>
                <jsp:setProperty name="controle" property="usuario" value="${usuario}"/>
                <%controle.pesquisar();%>
                
            </c:if>

        <table border=1>
            <tr><th>Codigo</th><th>Nome</th><th>Email</th><th>Grupo</th></tr>

            <c:forEach var="usuario" items="${controle.usuarios}">
                
                <tr>
                    <td>${usuario.codigo}</td>                     
                    <td>${usuario.nome}</td>                     
                    <td>${usuario.email}</td>
                    <td>${usuario.grupo.nome}</td>
                </tr>
                
            </c:forEach>            
        </table>
        
        </div>
                
        <div id="rodape">
            <h4>@Todos os direitos reservados.</h4>
        </div>
    </body>
</html>
