<%-- 
    Document   : alterarSenhaUsuario
    Created on : 18/06/2013, 14:25:48
    Author     : Fran
--%>

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
        <title>Alterar Senha do Usuario</title>
        
        <script>
            function valida(form) {
                if (form.senha.value == "" || form.senha.value.length < 6) {
                    alert("Preencha a senha corretamente.");
                    form.senha.focus();
                    return false;
                }

                if (form.conf_senha.value == "" || form.conf_senha.value.length < 6) {
                    alert("Preencha a confirmação de senha corretamente.");
                    form.conf_senha.focus();
                    return false;
                }

                if (form.senha.value != form.conf_senha.value) {
                    alert("A senha e a confirmação tem de ser iguais.");
                    form.conf_senha.focus();
                    return false;
                }
            }
        </script>
        
    </head>

    <body>
        <div id="wrap">
            <div class="container-fluid">

                <div class="row-fluid">
                    <div class="span12 topo">
                        <h1 class="h1">OF System</h1>
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
                            <h2>Alterar Senha do Usuario</h2>

                            <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
                            <jsp:useBean id = "user" class="modelo.Usuario"/>
                            <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
                            <jsp:useBean id = "grup" class="modelo.Grupo"/>

                            <jsp:setProperty name="user" property="codigo" value="${param.codigo}"/>

                            <jsp:setProperty name="controleUsuario" property="usuario" value="${controleUsuario.consultar(user)}"/> 

                            <form action='consultarUsuario.jsp' onsubmit="return valida(this)">
                                <fieldset>
                                    <label><b>Codigo:</b></label>
                                    <span class="input-xlarge uneditable-input">${controleUsuario.usuario.codigo}</span><br/>
                                    <input type="hidden" name="codigo" value="${controleUsuario.usuario.codigo}"/>

                                    <label>Nome:</label>
                                    <span class="input-xlarge uneditable-input">${controleUsuario.usuario.nome}</span><br/>
                                    <input type="hidden" name="nome" value="${controleUsuario.usuario.nome}" maxlength="30" size="90"/>
                                    <input type="hidden" name="email" value="${controleUsuario.usuario.email}" maxlength="30" size="90"/>
                                    <input type="hidden" name="telefone" value="${controleUsuario.usuario.telefone}" maxlength="30" size="90"/>
                                    <input type="hidden" name="grupo" value="${controleUsuario.usuario.grupo.codigo}" maxlength="30" size="90"/>

                                    <label>Senha:</label>
                                    <input type="password" name="senha" value="${controleUsuario.usuario.senha}" maxlength="30" size="90"/>
                                    <span class="help-inline">Senha com mais de 6 dígitos</span><br/>

                                    <label>Confirmar Senha:</label>
                                    <input type="password" name="confSenha" value="${controleUsuario.usuario.senha}" maxlength="30" size="90"/><br/>
                                </fieldset>

                                <SCRIPT LANGUAGE="JavaScript">
                                    function cancelar() {
                                        window.location = "consultarUsuario.jsp?codigo=${controleUsuario.usuario.codigo}";
                                    }
                                </script>

                                <input class="btn btn-warning" type='submit' name='alterar' value='Salvar'/>
                                <input class="btn" type="button" value="Cancelar" onClick="cancelar()"/> 
                            </form> 

                            <jsp:setProperty name="controleUsuario" property="usuario" value="${user}"/>

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
