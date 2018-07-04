<!DOCTYPE html>

<html>
    
    <head>
        
        <meta name = "layout" content = "main" /> <title> Realizando Cotización </title>

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
                    
                    <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>
                    
                    <g:set var = "proveedor" value = "${maestros.MaestroProveedor.get(params.proveedor)}" />
                    
                    <h1> Realizando Cotización (${proveedor.razonSocial}) </h1>
                    
                    <g:form resource = "${this.cotizaciones}" method = "POST">

                        <g:hiddenField name = "proveedor" value = "${proveedor.id}" />

                        <fieldset class = "form" style = "margin-left: 2.5%; width:95%"> 

                            <div class = "field half first">
                                
                                <label for = "name"> Fecha del Evento </label>

                                <input name = "fecha" type = "date" required = "required" style = "width:100%">

                            </div> <br/>

                            <div class = "field half first">
                                
                                <label for = "name"> Servicio </label>

                                <g:select name = "servicio" optionKey = "descripcion" from = "${proveedor.servicios}" required = "" noSelection = "['':'Seleccione un Servicio']" />

                                </select>   

                            </div> <br/>

                            <div class = "field half first">
                                
                                <label for = "name"> Comentario </label>

                                <input name = "comentario" type = "text" placeholder = "Descripción del Evento a Realizar" required = "required">

                            </div> <br/>

                        </fieldset>
                        
                        <br/> <g:submitButton style = "margin-left: 40%; width:20%" name = "create" class = "save" value = "Crear" /> <br/> <br/>
                        
                    </g:form>

                </div>
            
            </section>

        </div>

    </body>

</html>