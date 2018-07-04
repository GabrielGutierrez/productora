<!DOCTYPE html>

<html>
 
    <head>
        
        <meta name = "layout" content = "main" /> <title> Eventos </title>

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />  

    </head>

    <body>
        
        <sec:ifLoggedIn>
            
            <div id = "cssmenu">
                
                <ul>
                    <li class = "active"> <a href = '#'> <span> Inicio </span> </a> </li>
                    <li> <g:link action = "show" controller = "usuario" id = "${sec.loggedInUserInfo(field:'id')}"> Mi Perfil </g:link> </li>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PRODUCTOR'>
                        
                        <li> <g:link action = "index" controller = "listadoEventos"> Eventos </g:link> </li>
                        <li> <g:link action = "index" controller = "cotizaciones"> Cotizaciones </g:link> </li>
                        <li> <a href = '#'> <span> Mira como ven tu Perfil </span> </a> </li>

                    </sec:ifAnyGranted>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PROVEEDOR'>
                        
                        <li> <g:link action = "index" controller = "listadoEventos"> Eventos </g:link> </li>
                        <li> <g:link action = "index" controller = "cotizaciones"> Cotizaciones </g:link> </li>
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
            
            <g:form resource = "${this.listadoEventos}" method = "POST">
            
                <section id = "contacto" class = "main" style = "background:white">
            
                    <div class = "content scaffold-show" role = "main" style = "margin-bottom: 50px">
                      
                        <article class = "item" style = "width:95%; margin-left: 2.5%"> 
                                        
                            <header> <a href = "#" > <asset:image src = "Contactanos.png" alt = ""/> </a> </header> 

                        </article>

                        <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>
                
                        <h1> Creando Evento </h1> <br/>           
                            
                        <fieldset class = "form" style = "margin-left: 2.5%; width:95%"> 

                            <div class = "field half first">
                                                
                                <label> Nombre del Evento </label>

                                <input name = "nombre" type = "text" placeholder = "Nombre" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                        
                                <label> Fecha del Evento </label>

                                <input name = "fecha" style = "width:100%" type = "date" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Descripción</label> 

                                <input name = "descripcion" type = "text" placeholder = "Descripción del Evento" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Locación </label>

                                <input name = "locacion" type = "text" placeholder = "Locación del Evento" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Hora Inicio </label>

                                <input name = "horaFin" type = "text" placeholder = "Hora de Inicio" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Hora Fin </label>

                                <input name = "horaFin" type = "text" placeholder = "Hora de Fin" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Nombre del Cliente </label>

                                <input name = "nombreCliente" type = "text" placeholder = "Nombre del Cliente" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Teléfono del Cliente </label>

                                <input name = "telefonoCliente" type = "text" placeholder = "Teléfono del Cliente" required = "required">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Correo del Cliente </label>

                                <input name = "correoCliente" type = "text" placeholder = "Correo del Cliente" required = "required">

                            </div> <br/> 

                        </fieldset>

                    </div>

                </section>
                
                <g:submitButton style = "margin-left: 35%; width:30%; margin-bottom: 50px" name = "create" class = "save" value = "Crear" />

            </g:form>

        </div>

    </body>

</html>