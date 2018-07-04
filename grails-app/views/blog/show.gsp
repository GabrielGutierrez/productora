<!DOCTYPE html>

<html>
 
    <head>
        
        <meta name = "layout" content = "main" /> <title> Blog </title>

        <asset:stylesheet href = "menu/styles.css" />
        <link href = "//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel = "stylesheet" id = "bootstrap-css">
        <asset:stylesheet href = "epilogue/main.css"/>

        <style> 

            .blogShort{ border-bottom:1px solid #ddd;}
            
            .add{background: #333; padding: 10%; height: 300px;}

            .btn-blog 
            {
                color: #ffffff;
                background-color: #37d980;
                border-color: #37d980;
                border-radius:0;
                margin-bottom:10px
            }

            .btn-blog:hover,
            .btn-blog:focus,
            .btn-blog:active,
            .btn-blog.active,
            .open .dropdown-toggle.btn-blog 
            {
                color: white;
                background-color:#34ca78;
                border-color: #34ca78;
            }
            
            h2 { color:#34ca78; }

        </style>

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
                    
                    <h1> Blog </h1>

                </div>

                <div class = "container">

                    <div id = "blog" class = "row"> 
                                        
                        <div class = "col-md-10 blogShort">
                            
                            <g:set var = "blogs" value = "${transaccionales.Blog.findAllByProveedor(maestros.MaestroProveedor.get(params.proveedor))}" />

                            <g:each in  = "${blogs}" var = "blog">

                                <h1> ${blog.titulo} </h1>
                             
                                <img src = "/myapp/usuario/mostrarImagen/${transaccionales.Imagenes.findByBlog(blog).id}" width = "280" height = "370" class = "pull-left img-responsive thumb margin10 img-thumbnail" style = "margin-right:50px">
                                 
                                <article> <p> ${blog.articulo} </p> </article>
                                
                                <!-- <a class = "btn btn-blog pull-right marginBottom10" href = "http://bootsnipp.com/user/snippets/2RoQ">READ MORE</a> -->
                             
                            </g:each>

                         </div>
                 
                    </div> <br/> <br/>

                </div>

            </section>
            
        </div>
        
        <script src = "//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"> </script>
        <script src = "//code.jquery.com/jquery-1.11.1.min.js"> </script>

    </body>

</html>