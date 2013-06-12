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
        <meta charset="utf-8"/>
        <meta name="description" content="Teste Bootstrap"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/bootstrap.css" rel="stylesheet" media="screen"/>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" media="screen"/>
        <link href="../css/estilo.css" rel="stylesheet" media="screen"/>
        <title>Consultar Usuario</title>
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
                            <h2>Consultar Usuario</h2>

                            <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
                            <jsp:useBean id = "user" class="modelo.Usuario"/>
                            <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
                            <jsp:useBean id = "grup" class="modelo.Grupo"/>

                            <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>

                            <c:if test="${not empty param.alterar}">


                                <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>
                                <jsp:setProperty name="user" property="nome" value="${param.nome}"/>
                                <jsp:setProperty name="user" property="email" value="${param.email}"/>
                                <jsp:setProperty name="user" property="telefone" value="${param.telefone}"/>
                                <jsp:setProperty name="grup" property="codigo" value="${param.grupo}"/>
                                <jsp:setProperty name="user" property="grupo" value="${grup}"/>

                                ${controleUsuario.alterar(user)}

                            </c:if>

                            <jsp:setProperty name="controleUsuario" property="usuario" value="${controleUsuario.consultar(user)}"/>          

                            <fieldset>
                                <label><b>Codigo:</b></label>
                                <span class="input-xlarge uneditable-input">${controleUsuario.usuario.codigo}</span><br/>

                                <label><b>Nome:</b></label>
                                <span class="input-xlarge uneditable-input">${controleUsuario.usuario.nome}</span><br/>

                                <label><b>Email:</b></label>
                                <span class="input-xlarge uneditable-input">${controleUsuario.usuario.email}</span><br/>

                                <label><b>Telefone:</b></label>
                                <span class="input-xlarge uneditable-input">${controleUsuario.usuario.telefone}</span><br/>

                                <label><b>Grupo:</b></label>
                                <span class="input-xlarge uneditable-input">${controleUsuario.usuario.grupo.nome}</span><br/><br/>
                            </fieldset> 

                            <SCRIPT LANGUAGE="JavaScript">
                                function cancelar() {
                                    window.location = "pesquisarUsuario.jsp";
                                }
                                function alterar(cod) {
                                    window.location = "alterarUsuario.jsp?codigo=" + cod;
                                }
                                function alterarSenha() {
                                    window.location = "alterarSenhaUsuario.jsp?codigo=${usuario.codigo}";
                                }
                                function excluir() {
                                    
                                    decisao = confirm("Tem Certeza ?");
                                    
                                    if (decisao) {
                                        
                                        alert("Usuário excluido com sucesso!");
                                        window.location = "pesquisarUsuario.jsp?dell=${user.codigo}";
                                        
                                    } else {
                                        alert("Tudo bem, vamos manter o usuário cadastrado.");
                                    }
                                    
                                }
                            </script>

                            <input class="btn" type='button' name='alterar' value='Alterar' onclick="alterar(${user.codigo})"/>
                            <!--<input class="btn" type='button' name='alterarSenha' value='Alterar Senha' onclick="alterarSenha()"/>-->
                            <input class="btn" type='button' name='excluir' value='Excluir' onclick="excluir()"/>
                            <input class="btn" type="button" value="Cancelar" onclick="cancelar()"/>
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
</body>
</html>
