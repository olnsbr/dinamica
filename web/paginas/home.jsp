<%-- 
    Document   : home
    Created on : 10/06/2013, 15:01:23
    Author     : Fran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="description" content="Teste Bootstrap"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../paginas/css/bootstrap.css" rel="stylesheet" media="screen"/>
        <link href="../paginas/css/bootstrap-responsive.css" rel="stylesheet" media="screen"/>
        <link href="../paginas/css/estilo.css" rel="stylesheet" media="screen"/>
        <title>Home</title>
    </head>
    <body>
        <div id="wrap">
            <div class="container-fluid">

                <div class="row-fluid">
                    <div class="span12 topo">
                    </div>

                    <div class="row-fluid">
                        <div class=" row-fluid span12 corTopo">
                            <ul class="nav nav-list">
                                <li class="active"><a href="#"><i class="icon-home icon-white"></i> Início</a></li>                            
                            </ul>                    
                        </div>                    
                    </div>
                    
                    <div class="row-fluid">
                        <div class="span4 cor2">
                            <a class="btn btn-large" href="../paginas/usuario/pesquisarUsuario.jsp"><img src="../paginas/img/casal.png" class="img-rounded">
                                <abbr title="Acesse os usuários"><h4>Usuários</h4></abbr>
                            </a>
                        </div>  
                        <div class="span4 cor2">
                            <a class="btn btn-large" href="../paginas/grupo/pesquisarGrupo.jsp"><img src="../paginas/img/grupo.png" class="img-rounded">
                                <abbr title="Acesse os grupos"><h4>Grupos</h4></abbr>
                            </a>                            
                        </div> 
                        <div class="span4 cor2">
                            <a class="btn btn-large" href="../paginas/usuario/pesquisarUsuario.jsp"><img src="../paginas/img/acao.png" class="img-rounded">
                                <abbr title="Acesse as ações"><h4>Ações</h4></abbr>
                            </a>
                        </div> 
                    </div>

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
