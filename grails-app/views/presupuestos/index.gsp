<!DOCTYPE html>

<html>
    
    <head>
        
        <meta name = "layout" content = "main" /> <title> Datos del Evento </title>

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />

    </head>

    <body>
        
        <sec:ifLoggedIn>
            
            <div id = "cssmenu">
                
                <ul>
                    <li> <a href = '/myapp'> <span> Inicio </span> </a> </li>
                    <li> <g:link action = "show" controller = "usuario" id = "${sec.loggedInUserInfo(field:'id')}"> Mi Perfil </g:link> </li>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PRODUCTOR'>
                        
                        <li class = "active"> <g:link action = "index" controller = "listadoEventos"> Eventos </g:link> </li>
                        <li> <g:link action = "index" controller = "cotizaciones"> Cotizaciones </g:link> </li>
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
        
                <div class = "content scaffold-show" role = "main">
                    
                    <g:set var = "evento" value = "${transaccionales.ListadoEventos.get(params.evento)}" />

                    <article class = "item" style = "width:95%; margin-left: 2.5%"> 
                                    
                        <header> <a href = "#" > <asset:image src = "Contactanos.png" alt = ""/> </a> </header> 

                    </article>
                    
                    <g:link action = "create" params = "[evento:evento.id]" class = "button" style = "margin-left: 2.5%"> <i class = "fa fa-file"> </i> Crear Presupuesto </g:link>

                    <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>

                    <h1> Presupuesto para el Evento ${evento.nombre} </h1>
                    
                    <table style = "margin-left:2.5%; width:95%">

                        <tr> <th> Item </th> <th> Cantidad </th> <th> Valor Unitario </th> <th> Valor Total </th> <th> Editar </th> <th> Eliminar </th> </tr>

                        <g:each in = "${presupuestos}" var = "presupuesto">

                            <tr> 
                                <td> ${presupuesto.item} </td> <td> ${presupuesto.cantidad} </td> 
                                <td> ${presupuesto.valorUnitario} </td> 
                                <td> ${presupuesto.cantidad * presupuesto.valorUnitario} </td> 
                                <td> <g:link action = "edit" id = "${presupuesto.id}" class = "button"> Editar </g:link> </td>
                                <td> <g:link action = "delete" params = "[id:presupuesto.id]" class = "button" onclick = "return confirm('¿Esta seguro de eliminar el prespuesto?')"> Eliminar </g:link> </td>
                            </tr>

                        </g:each>

                    </table>

                </div> <br/>

            </section>

        </div>

    </body>

</html>