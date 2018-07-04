<!DOCTYPE html>

<html>
   
    <head>
        
        <meta name = "layout" content = "main" /> <title> Listado de Proveedores </title>

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />

        <asset:stylesheet href = "vistaRapida/vistaRapida.css" />

        <style> .noclass:hover { background-color:#D58B94; } </style>

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

                    <h1> Listado de Proveedores </h1>
                    
                    <g:form action = "index">

                        <table style = "margin-left:2.5%; width:95%; border: 1px solid #DFDFDF !important">

                            <th> Razón Social </th> <th> Descripción </th> <th> Servicios </th> <th> Vista Rápida </th> 

                            <tr bgcolor = "#D58B94" class = "noclass"> 
                                
                                <td> <input name = "razonSocial" value = "${params.razonSocial}"> </td>
                                <td> <input name = "descripcion" value = "${params.descripcion}"> </td>
                                <td> <input name = "servicios" value = "${params.servicios}"> </td>
                                <td> </td>

                            </tr>

                            <g:each in = "${maestroProveedorList}" var = "proveedor">

                                <tr> 
                                    <td> ${proveedor.razonSocial} </td> <td> ${proveedor.descripcion} </td> 
                                    <td> ${proveedor.servicios ? proveedor.servicios.toString()[1..-2] : 'Sin Servicios Ingresados'} </td> 

                                    <td> <a href = "#" class = "btn-view"> Ver </a> </td> 

                                </tr>

                            </g:each>

                        </table> 

                       <input style = "margin-left:40%; width: 20%" type = "submit" class = "buttons" value = "Buscar"> </button> <br/>

                    </g:form>

                </div>

            </section>
                
        </div>

        <div class = "mask"> </div>
            
        <div id = "quick-view-pop-up">
                
            <div class = "quick-view-panel">
                
                <div class = "quick-view-close"> </div>
            
                <div class = "mini-carousel">
                    
                    <ul class = "mini-item">

                        <g:each in ="${transaccionales.Imagenes.findAllByProveedor(maestroProveedorList[0])}" var = "imagen">   
                            <li> <a href = "#"> <img width = "100" height = "100" src = "/myapp/usuario/mostrarImagen/${imagen.id}" > </a> </li>

                        </g:each>

                    </ul>

                </div>

                <div class = "carousel">
                        
                    <div class = "image-large">
                        
                        <ul>
                            <g:each in ="${transaccionales.Imagenes.findAllByProveedor(maestroProveedorList[0])}" var = "imagen">   
                            <li> <a href = "#"> <img width = "280" height = "370" src = "/myapp/usuario/mostrarImagen/${imagen.id}" alt = "image2-small"> </a> </li>
                            
                        </g:each>
                        </ul>

                        <a href = "#" class = "prev" 
                        style = "border-style:none !important; margin-left:25px; margin-top: 200px"> Anterior </a>
                        
                        <a href = "#" class = "next" 
                        style = "border-style:none !important; margin-right:32px; margin-top: 200px"> Siguiente </a>
                    
                    </div>
        
                </div>

                <div class = "detail">
                    
                    <div class = "product-details">
                        
                        <h2 class = "product-name"> ${maestroProveedorList[0].razonSocial} </h3>
                        
                        <h3 class = "product-price"> Servicios: ${maestroProveedorList[0].servicios ? maestroProveedorList[0].servicios.descripcion.toString()[1..-2] : 'Sin Servicios'} </h2>
                        
                        <div class = "option-dropdowns"> ${maestroProveedorList[0].descripcion} <br> </div>   

                        <g:link controller = "blog" action = "show" params = "[proveedor:maestroProveedorList[0].id]" class = "view-more-detail"> Ver Blog del Proveedor </g:link>

                    </div>
                    
                    <div> <g:link controller = "cotizaciones" action = "create" class = "view-more-detail" 
                    params = "[proveedor:maestroProveedorList[0].id]"> Cotizar </g:link> </div>

                </div>

            </div>

        </div>
    
        <asset:javascript src = "epilogue/jquery.min.js"/>
        <asset:javascript src = "vistaRapida/vistaRapida.js"/>

    </body>

</html>