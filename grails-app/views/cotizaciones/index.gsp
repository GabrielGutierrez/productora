<!DOCTYPE html>

<html>
 
    <head>
        
        <meta name = "layout" content = "main" /> <title> Listado de Cotizaciones </title>

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />

    </head>

    <body>

        <sec:ifLoggedIn>
            
            <div id = "cssmenu">
                
                <ul>
                    <li> <a href = '/myapp'> <span> Inicio </span> </a> </li>
                    <li> <g:link action = "show" controller = "usuario" id = "${sec.loggedInUserInfo(field:'id')}"> Mi Perfil </g:link> </li>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PRODUCTOR'>
                        
                        <li> <g:link action = "index" controller = "listadoEventos"> Eventos </g:link> </li>
                        <li class = "active"> <g:link action = "index" controller = "cotizaciones"> Cotizaciones </g:link> </li>
                        <li> <a href = '#'> <span> Mira como ven tu Perfil </span> </a> </li>
                        
                    </sec:ifAnyGranted>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PROVEEDOR'>
                        
                        <li> <g:link action = "index" controller = "blog"> Blog </g:link> </li>
                        <li> <a href = '#'> <span> Mira como ven tu Perfil </span> </a> </li>

                    </sec:ifAnyGranted>
                    
                    <sec:ifAnyGranted roles = 'ROLE_ADMIN'>
                        
                        <li> <g:link action = "index" controller = "usuario"> Usuarios </g:link> </li>

                    </sec:ifAnyGranted>

                    <li class = "last"> <g:link controller = "logout"> Salir </g:link> </li>

                </ul>

            </div>

        </sec:ifLoggedIn>
    
        <div class = box>
                
            <section id = "contacto" class = "main" style = "background:white">
        
                <div class = "content scaffold-show" role = "main" style = "margin-bottom: 50px">
                  
                    <article class = "item" style = "width:95%; margin-left: 2.5%"> 
                                    
                        <header> <a href = "#" > <asset:image src = "Contactanos.png" alt = ""/> </a> </header> 

                    </article>
                    
                    <g:link action = "index" controller = "maestroProveedor" class = "button" style = "margin-left: 2.5%"> <i class = "fa fa-file"> </i> Realizar Cotización </g:link>

                    <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>
                    
                    <h1> Listado de Cotizaciones </h1>
            
                    <table style = "margin-left: 2.5%; width:95%"> 

                        <tr> <th> Fecha del Evento </th> <th> Servicio Cotizado </th> <th> Comentario </th> <th> Proveedor </th> </tr>

                        <g:each in = "${cotizacionesList}" var = "cotizacion">

                            <tr> 
                                <td> ${cotizacion.fecha} </td> <td> ${cotizacion.servicio} </td> 
                                <td> ${cotizacion.comentario} </td> <td> ${cotizacion.proveedor} </td>
                            </tr>

                        </g:each>

                    </table>    

                </div> <br/>

            </section>

        </div>

    </body>

</html>