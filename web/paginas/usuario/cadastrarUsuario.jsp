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
        <meta charset="utf-8"/>
        <meta name="description" content="Teste Bootstrap"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/bootstrap.css" rel="stylesheet" media="screen"/>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" media="screen"/>
        <link href="../css/estilo.css" rel="stylesheet" media="screen"/>        
        <title>Cadastrar Usuario</title>
        <script>
            function IsNum(v)

            {
                var ValidChars = "0123456789";
                var IsNumber = true;
                var Char;


                for (i = 0; i < v.length && IsNumber == true; i++)
                {
                    Char = v.charAt(i);
                    if (ValidChars.indexOf(Char) == -1)
                    {
                        IsNumber = false;
                    }
                }
                return IsNumber;

            }

            function valida(form) {
                if (form.nome.value == "") {
                    alert("Preencha o nome corretamente.");
                    form.nome.focus();
                    return false;
                }

                if (form.tel.value == "") {
                    alert("Preencha o telefone corretamente.");
                    form.tel.focus();
                    return false;
                }

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

            function telefone(f) {
                if (f.tel.value.length < 9 || f.tel.value.length > 10) {
                    alert("Preencha o telefone corretamente.");
                    f.tel.focus();
                } else {
                    ddd = f.tel.value.substring(0, 2);
                    if (f.tel.value.length == 9) {
                        part1 = f.tel.value.substring(2, 5);
                        part2 = f.tel.value.substring(5, 9);
                    }
                    if (f.tel.value.length == 10) {
                        part1 = f.tel.value.substring(2, 6);
                        part2 = f.tel.value.substring(6, 10);
                    }
                    f.tel.value = "(" + ddd + ") " + part1 + "-" + part2
                }
            }
        </script>
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
                            <h2>Cadastrar Usuario</h2>

                            <jsp:useBean id = "controleUsuario" class="controle.UsuarioControle"/>
                            <jsp:useBean id = "user" class="modelo.Usuario"/>
                            <jsp:useBean id = "controleGrupo" class="controle.GrupoControle"/>
                            <jsp:useBean id = "grup" class="modelo.Grupo"/>

                            <form action='cadastrarUsuario.jsp' onsubmit="return valida(this)">
                                <fieldset>                
                                    <label>Nome:</label>
                                    <input type="text" placeholder="Digite seu nome..." name="nome" value="${user.nome}" maxlength="30" size="90"/><br/>

                                    <label>Email:</label>
                                    <input type="email" placeholder="email@email.com" name="email" value="${user.email}" maxlength="30" size="90"/><br/>

                                    <label>Telefone:</label>
                                    <input type="text" placeholder="(00) 9999-9999" name="tel" value="${user.telefone}" maxlength="30" size="90"/><br/>

                                    <label>Grupo:</label>
                                    <select name='grupo'>

                                        <c:forEach var="grupo" items="${controleGrupo.grupos}">
                                            <option value="${grupo.codigo}">${grupo.nome}</option>
                                        </c:forEach>

                                    </select>
                                    <br/>

                                    <label>Senha:</label>
                                    <input type="password" name="senha" value="${user.senha}" maxlength="30" size="90"/><br/>
                                    <label>Confirmar Senha:</label>
                                    <input type="password" name="conf_senha" value="${user.senha}" maxlength="30" size="90"/><br/>

                                </fieldset>  

                                <input class="btn" type='submit' name='salvar' value='Salvar'>

                                <SCRIPT LANGUAGE="JavaScript">
                                    function cancelar() {
                                        window.location = "pesquisarUsuario.jsp";
                                    }
                                </script>

                                <input class="btn" type="button" value="Cancelar" onClick="cancelar()">
                            </form>

                            <c:if test="${not empty param.salvar}">
                                <jsp:setProperty name="user" property="nome" value="${param.nome}"/>
                                <jsp:setProperty name="user" property="email" value="${param.email}"/>
                                <jsp:setProperty name="user" property="telefone" value="${param.telefone}"/>
                                <jsp:setProperty name="grup" property="codigo" value="${param.grupo}"/>
                                <jsp:setProperty name="user" property="grupo" value="${grup}"/>
                                <jsp:setProperty name="user" property="senha" value="${param.senha}"/>
                                <jsp:setProperty name="controleUsuario" property="usuario" value="${user}"/>

                                <SCRIPT LANGUAGE="JavaScript">

                                    alert("Registro incluído com sucesso!");

                                </script>

                                <%controleUsuario.cadastrar();%>
                            </c:if>
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
</html>
