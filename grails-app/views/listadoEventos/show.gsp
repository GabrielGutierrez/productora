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
                  
                    <article class = "item" style = "width:95%; margin-left: 2.5%"> 
                                    
                        <header> <a href = "#" > <asset:image src = "Contactanos.png" alt = ""/> </a> </header> 

                    </article>
                    
                    <g:link controller = "presupuestos" action = "index" params = "[evento:this.listadoEventos.id]" class = "button" style = "margin-left: 2.5%"> <i class = "fa fa-file"> </i> Presupuesto del Evento </g:link>
                    
                    <g:link controller = "tareas" action = "index" class = "button" style = "margin-left: 2.5%"> <i class = "fa fa-file"> </i> Tareas Pendientes </g:link>

                    <g:link action = "create" class = "button" style = "margin-left: 2.5%"> <i class = "fa fa-file"> </i> Timming del Evento </g:link>

                    <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>

                    <h1> Datos del Evento </h1>
                    
                    <f:display bean = "listadoEventos" />
                    
                </div>
            
            </section>
        
            <g:form resource = "${this.listadoEventos}" method = "DELETE">
                    
                <g:link style = "margin-left: 35%; width:15%; margin-bottom: 50px; margin-top: 50px; margin-right: 30px" class = "button" action = "edit" resource = "${this.listadoEventos}"> Editar </g:link>
                        
                <input style = "width:15%" class = "delete" type = "submit" value = "Eliminar" onclick = "return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

            </g:form>

        </div>

    </body>

</html>