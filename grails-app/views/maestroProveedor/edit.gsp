<!DOCTYPE html>

<html>
    
    <head>
        
        <meta name = "layout" content = "main" /> <title> Datos de Proveedor </title>

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />    

    </head>
    
    <body>
        <sec:ifLoggedIn>
            
            <div id = "cssmenu">
                
                <ul>
                    <li> <a href = '#'> <span> Inicio </span> </a> </li>
                    <li> <g:link action = "show" controller = "usuario" id = "${sec.loggedInUserInfo(field:'id')}"> Mi Perfil </g:link> </li>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PRODUCTOR'>
                        
                        <li> <g:link action = "index" controller = "listadoEventos"> Eventos </g:link> </li>
                        <li class = "active"> <g:link action = "index" controller = "cotizaciones"> Cotizaciones </g:link> </li>
                        <li> <a href = '#'> <span> Mira como ven tu Perfil </span> </a> </li>

                    </sec:ifAnyGranted>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PROVEEDOR'>
                        
                        <li> <g:link action = "index" controller = "cotizaciones"> Blog </g:link> </li>
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
                    <h1> Datos del Proveedor </h1>
                    
                    <g:form resource = "${this.maestroProveedor}" method = "PUT">

                        <g:hiddenField name = "version" value = "${this.maestroProveedor.version}" />

                        <fieldset class = "form" style = "margin-left:2.5%">

                            <br/> <div class = "field half first">
                                            
                                <label for = "name"> Razón Social </label>

                                <input name = "razonSocial" type = "text" placeholder = "Nombre del Proveedor" required = "required" value = "${this.maestroProveedor.razonSocial}">

                            </div> <br/>

                            <div class = "field half first">
                                
                                <label for = "name"> Descripción </label>

                                <input name = "descripcion" type = "text" placeholder = "Descripción del Proveedor" required = "required" value = "${this.maestroProveedor.descripcion}">

                            </div> <br/>

                        </fieldset>     

                        <g:submitButton name = "actualizar" class = "save" value = "Actualizar" style = "margin-left: 2.5%" /> <br/> <br/> 

                    </g:form>
                    
                    <g:form action = "agregarImagen" enctype = "multipart/form-data"> 

                        <g:hiddenField name = "proveedor" value = "${this.maestroProveedor.id}" />
                        
                        <fieldset class = "form" style = "margin-left:2.5%">

                            <div class = "field half first">
                                
                                <label for = "name"> Agregar Imagen </label>

                                <input name = "imagen" type = "file" required = "required" placeholder = "Seleccione">

                            </div> <br/>
                            
                        </fieldset>
                            
                        <g:submitButton name = "create" class = "save" value = "Agregar" style = "margin-left: 2.5%"/> <br/> <br/>

                    </g:form>
                    
                    <g:form action = "agregarServicio"> 
                    
                        <g:hiddenField name = "proveedor" value = "${this.maestroProveedor.id}" />
                        
                        <fieldset class = "form" style = "margin-left:2.5%">

                            <div class = "field half first">
                                        
                                <label for = "name"> Agregar Servicio </label>

                                <input type = "text" name = "servicio" required = "required" placeholder = "Ingrese la descripcion del Servicio">

                            </div> <br/>
                        
                        </fieldset>
                            
                        <g:submitButton name = "create" class = "save" value = "Agregar" style = "margin-left: 2.5%"/> <br/> <br/>

                    </g:form>        
                </div>

            </section>

        </div>

    </body>

</html>