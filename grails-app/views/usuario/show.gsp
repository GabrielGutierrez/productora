<!DOCTYPE html>

<html>
 
    <head>
        
        <meta name = "layout" content = "main" /> <title> Tu Perfil </title>
        
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

                    <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>

                    <sec:ifAnyGranted roles = "ROLE_PROVEEDOR"> <h1> Tu Perfil (Proveedor) </h1> </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles = "ROLE_ADMIN"> <h1> Tu Perfil (Administrador) </h1> </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles = "ROLE_PRODUCTOR"> <h1> Tu Perfil (Productor) </h1> </sec:ifAnyGranted>
                    
                    <f:display bean = "usuario" except = "passwordExpired, accountLocked, accountExpired, password, enabled"/>
                    
                    <g:set var = "productora" value = "${maestros.MaestroProductora.findByUsuarioId(usuario.id)}"/>
                    <g:set var = "proveedor" value = "${maestros.MaestroProveedor.findByUsuario(usuario)}"/>

                    <sec:ifAnyGranted roles = "ROLE_PROVEEDOR"> 

                        <h1> Datos Proveedor </h1> 

                        <f:display bean = "proveedor" order = "razonSocial, descripcion" /> 
                            
                        <h1> Imágenes </h1> <br/>
                        
                        <div>
                            
                            <g:each in  = "${transaccionales.Imagenes.findAllByProductora(productora)}" var = "imagen">

                                <a style = "margin-left:2.5%; border-style: none !important;" target = "_blank" href = "/myapp/usuario/mostrarImagen/${imagen.id}"> 
                                                    
                                    <img width = "100" height = "50" alt = "Img" src = "/myapp/usuario/mostrarImagen/${imagen.id}"/>
                                
                                </a>

                                <g:link action = "eliminarImagen" id = "${imagen.id}" controller = "MaestroProveedor" class = "btn" onclick = "return confirm('¿Esta seguro de eliminar la imagen?')" style = ""> Eliminar </g:link>

                            </g:each>

                        </div>

                        <h1> Servicios Proveedor </h1>                             

                        <g:set var = "servicios" value = "${maestros.MaestroServicios.findAllByProveedor(proveedor)}" />
                        
                        <br/> <div>
                            
                            <g:each in = "${servicios}" var = "servicio">
                              
                                <span style = "margin-left:2.5%"> ${servicio.descripcion} </span>

                                <g:link action = "eliminarServicio" id = "${servicio.id}" controller = "MaestroProveedor" class = "btn btn-danger" onclick = "return confirm('¿Esta seguro de eliminar el servicio?')" style = "margin-left:25px"> Eliminar </g:link>

                            </g:each>

                        </div> <br/>   

                    </sec:ifAnyGranted>

                    <sec:ifAnyGranted roles = "ROLE_PRODUCTOR"> 

                        <h1> Datos Productora </h2> 

                        <f:display bean = "productora" order = "razonSocial, descripcion"/>                           

                        <h1> Imágenes </h1> <br/>
                        
                        <div>
                            
                            <g:each in  = "${transaccionales.Imagenes.findAllByProductora(productora)}" var = "imagen">

                                <a style = "margin-left:2.5%; border-style: none !important;" target = "_blank" href = "/myapp/usuario/mostrarImagen/${imagen.id}"> 
                                    
                                    <img width = "100" height = "50" alt = "Img" src = "/myapp/usuario/mostrarImagen/${imagen.id}"/>
                                    
                                </a>

                                <g:link action = "eliminarImagen" id = "${imagen.id}" controller = "MaestroProductora" class = "btn" onclick = "return confirm('¿Esta seguro de eliminar la imagen?')" style = ""> Eliminar </g:link>

                            </g:each>

                        </div>

                    </sec:ifAnyGranted>

                </div>

            </section>
            
            <br/> <g:link style = "margin-left: 35%; width:30%; margin-bottom: 50px; margin-top: 30px" class = "button" action = "edit" resource = "${this.usuario}"> Editar Perfil </g:link>

            <sec:ifAnyGranted roles = "ROLE_PRODUCTOR"> 

                <g:if test = "${productora}"> 

                    <g:link style = "margin-left: 35%; width:30%; margin-bottom: 50px; margin-top: 30px" class = "button" action = "edit" controller = "MaestroProductora" id = "${productora.id}"> Editar Productora </g:link>

                </g:if>

                <g:else> 

                    <g:link style = "margin-left: 35%; width:30%; margin-bottom: 50px; margin-top: 30px" class = "button" action = "create" controller = "MaestroProductora"> Editar Productora </g:link>

                </g:else>

            </sec:ifAnyGranted>
            
            <sec:ifAnyGranted roles = "ROLE_PROVEEDOR"> 

                <g:if test = "${proveedor}"> 

                    <g:link style = "margin-left: 35%; width:30%; margin-bottom: 50px; margin-top: 30px" class = "button" action = "edit" controller = "MaestroProveedor" id = "${proveedor.id}"> Editar Proveedor </g:link>

                </g:if>

                <g:else> 

                    <g:link style = "margin-left: 35%; width:30%; margin-bottom: 50px; margin-top: 30px" class = "button" action = "create" controller = "MaestroProveedor"> Editar Proveedor </g:link>

                </g:else>

            </sec:ifAnyGranted>

        </div>

    </body>

</html>