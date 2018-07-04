<!DOCTYPE html>

<html>
 
    <head> 

        <meta name = "layout" content = "main" /> <title> Editando el Perfil </title> 

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />    

    </head>

    <body>

        <sec:ifLoggedIn>
            
            <div id = "cssmenu">
                
                <ul>
                    <li> <a href = '#'> <span> Inicio </span> </a> </li>
                    <li class = "active"> <g:link action = "show" controller = "usuario" id = "${sec.loggedInUserInfo(field:'id')}"> Mi Perfil </g:link> </li>
                    
                    <sec:ifAnyGranted roles = 'ROLE_PRODUCTOR'>
                        
                        <li> <g:link action = "index" controller = "listadoEventos"> Eventos </g:link> </li>
                        <li> <g:link action = "index" controller = "cotizaciones"> Cotizaciones </g:link> </li>
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
            
            <g:form resource = "${this.usuario}" method = "PUT">
                
                <section id = "contacto" class = "main" style = "background:white">
        
                        <div class = "content scaffold-show" role = "main">
                          
                            <article class = "item" style = "width:95%; margin-left: 2.5%"> 
                                            
                                <header> <a href = "#" > <asset:image src = "Contactanos.png" alt = ""/> </a> </header> 

                            </article>
                            
                            <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>
                    
                            <sec:ifAnyGranted roles = "ROLE_PROVEEDOR"> <h1> Editando tu Perfil (Proveedor) </h1> </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles = "ROLE_ADMIN"> <h1> Editando tu Perfil (ADMIN) </h1> </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles = "ROLE_PRODUCTOR"> <h1> Editando tu Perfil (Productor) </h1> </sec:ifAnyGranted>
                                                                       
                            <g:hiddenField name = "version" value = "${this.usuario?.version}" />
                            
                            <fieldset class = "form" style = "margin-left:2.5%; width:95%"> 

                                <br/> <div class = "field half first">
                                            
                                    <label for = "name"> Username </label>

                                    <input name = "username" type = "text" placeholder = "Nombre de Usuario" required = "required" value = "${this.usuario.username}">

                                </div> <br/> 

                                <div class = "field half first">
                                            
                                    <label for = "name"> Contraseña </label>

                                    <input name = "password" type = "text" placeholder = "Contraseña" required = "required" value = "${this.usuario.password}">

                                </div> <br/>

                                <div class = "field half first">
                                            
                                    <label for = "name"> Nombre </label>

                                    <input name = "nombre" type = "text" placeholder = "Nombre" required = "required" value = "${this.usuario.nombre}">

                                </div> <br/> 

                                <div class = "field half first">
                                            
                                    <label for = "name"> Apellido </label>

                                    <input name = "apellido" type = "text" placeholder = "Apellido Paterno" required = "required" value = "${this.usuario.apellido}">

                                </div> <br/>     

                                <div class = "field half first">
                                            
                                    <label for = "name"> Dirección </label>

                                    <input name = "direccion" type = "text" placeholder = "Dirección Completa" required = "required" value = "${this.usuario.direccion}">

                                </div> <br/> 

                                <div class = "field half">
                                            
                                    <label for = "email"> Correo </label>
                                    
                                    <input name = "correo" type = "email" placeholder = "Correo de Contacto" required = "required" value = "${this.usuario.correo}">
                                
                                </div> <br/> 

                                <div class = "field half first">
                                            
                                    <label for = "name"> Teléfono </label>

                                    <input name = "telefono" type = "text" placeholder = "Teléfono de Contacto" required = "required" value = "${this.usuario.telefono}">

                                </div> <br/>     

                            </fieldset>

                        </div>

                    </section>

                    <br/> <input style = "margin-left: 35%; width:30%; margin-bottom: 50px; margin-top: 15px" class = "save" type = "submit" value = "Actualizar" />

                </g:form>
        </div>

    </body>

</html>