<!doctype html>

<html>
    
    <head> 

        <meta name = "layout" content = "main"/> <title> Bienvenido </title> 

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />
         
        <asset:stylesheet href = "slider/slider.css" /> 

    </head>
    
    <body>
        
        <sec:ifNotLoggedIn>
            
            <div id = "cssmenu">
                
                <ul>
                   <li class = "active"> <a href = '#'> <span> Inicio </span> </a> </li>
                   <li> <g:link action = "index" controller = "cotizaciones"> Cotiza </g:link> </li>
                   <li> <g:link action = "auth" controller = "login"> Ingresa </g:link> </li>
                </ul>

            </div>

        </sec:ifNotLoggedIn>

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

        <header id = "header" class = "alt">
            
            <div class = "inner"> <h1> Pro Events </h1> <p style = "color:white"> Tu lugar para adiministrar proveedores </p> </div>

        </header>  

        <div id = "wrapper">

            <!-- Banner -->
            <section id = "intro" class = "main item">
                
                <span class = "icon fas fa-glass major"> </span>
                
                <h2> Acerca de Nosotros </h2>
                
                <p> Algo de información con respecto a la producción de eventos. </p>
                
                <ul class = "actions"> <li> <input type = "button" id = "contactanos" value = "Contáctanos"/> </li> 

                </ul>

            </section>

            <!-- Items -->
            <section class = "main items">
                
                <article class = "item">
                    
                    <header>
                        
                        <a href = "#"> <asset:image src = "proveedor.jpg" alt = ""/> </a>
                        
                        <h3> Proveedores </h3>

                    </header>

                    <p> Algún texto que hable de los proveedores. </p>

                    <ul class = "actions"> <li> <a href = "#" class = "button"> Ver </a> </li> </ul>

                </article>

                <article class = "item">
                    
                    <header>
                        
                        <a href = "#"> <asset:image src = "productor.jpg" alt = ""/> </a>

                        <h3> Productores </h3>

                    </header>

                    <p> Algún texto que hable de los productores. </p>

                    <ul class = "actions"> <li> <a href = "#" class = "button"> Ver </a> </li> </ul>

                </article>
                
                <article style = "margin-left:30%" class = "item">
                    
                    <header>
                        
                        <a href = "#"> <asset:image src = "productor.jpg" alt = ""/> </a>

                        <h3> Cotiza </h3>

                    </header>

                    <p> Algún texto que hable de las cotizaciones. </p>

                    <ul class = "actions"> <li> <a href = "#" class = "button"> Cotiza! </a> </li> </ul>

                </article>

            </section>
 
            <!-- CTA -->
            <section class = "main special">
                
                <h2 align = "center"> Productoras Inscritas </h2>

                <div id = "slider1">
                    
                    <a href = "#" class = "control_next1">> </a>
                    <a href = "#" class = "control_prev1"> <</a>
                    
                    <ul>
                        <li> <a href = "#"> <asset:image src = "slider4.jpg" title = "Ve su Perfil!"/> </a> </li>
                        <li> <a href = "#"> <asset:image src = "slider1.jpg" title = "Ve su Perfil!"/> </a> </li>
                        <li> <a href = "#"> <asset:image src = "slider2.jpg" title = "Ve su Perfil!"/> </a> </li>
                        <li> <a href = "#"> <asset:image src = "slider3.jpg" title = "Ve su Perfil!"/> </a> </li>
                    </ul>  

                </div>
                
                <br/> <ul style = "margin-left:42%" class = "actions"> <li> <a href = "#" class = "button"> Inscríbete! </a></li> </ul>

            </section> 

            <section class = "main special">
                
                <h2 align = "center"> Algunos Proveedores </h2>

                <div id = "slider">
                    
                    <a href = "#" class = "control_next">> </a>
                    <a href = "#" class = "control_prev"> <</a>
                    
                    <ul>
                        <li> <a href = "#"> <asset:image src = "slider1.jpg" title = "Cotiza!"/> </a> </li>                
                        <li> <a href = "#"> <asset:image src = "slider2.jpg" title = "Cotiza!"/> </a> </li>
                        <li> <a href = "#"> <asset:image src = "slider3.jpg" title = "Cotiza!"/> </a> </li>
                        <li> <a href = "#"> <asset:image src = "slider2.jpg" title = "Cotiza!"/> </a> </li>
                    </ul>  

                </div>

                <br/> <ul style = "margin-left:33%" class = "actions"> <li> <a href = "#" class = "button"> Únete a nuestros Proveedores! </a> </li> </ul>

            </section>    

            <section id = "contacto" class = "main" style = "background:white">
                
                <div class = "box" style = "border-style:none; border-color:none;">
                    
                    <div class = "content">
                        
                        <article class = "item"> 
                            
                            <header> <a href = "#" > <asset:image src = "Contactanos.png" alt = ""/> </a> </header> 

                        </article>

                        <h2 class = "align-center title"> Contáctanos <i class = "glyphicon glyphicon-envelope"> </i> </h2> 

                        <hr />

                        <form action = "#" method = "post">

                            <div class = "field half first">
                                
                                <label for="name"> Nombre </label>

                                <input name = "name" id = "name" type="text" placeholder = "Name" required = "required">

                            </div> <br/> 

                            <div class = "field half">
                                
                                <label for = "email"> Correo </label>
                                
                                <input name = "email" id = "email" type = "email" placeholder = "Email" required = "required">
                            
                            </div> <br/> 

                            <div class = "field">
                                
                                <label for = "dept"> Área de Interés </label>
                                
                                <div class = "select-wrapper">
                                    
                                    <select name = "dept" id = "dept" required = "">
                                        
                                        <option value = ""> - Área - </option>
                                        <option value = "proveedor"> Proveedor </option>
                                        <option value = "productor"> Productor </option>

                                    </select>

                                </div>

                            </div>

                            <div class = "field">
                                
                                <br/> <label for = "message"> Observación </label>
                                <textarea name = "message" id = "message" rows = "6" placeholder = "Message"> </textarea>

                            </div>

                            <ul class = "actions align-center"> 

                                <br/> <li> <input value = "Enviar" class = "button special next" type = "submit"> </li>

                            </ul>

                        </form>

                    </div>

                </div>

            </section>
                        
            <asset:javascript src = "epilogue/jquery.min.js"/>
            <asset:javascript src = "epilogue/skel.min.js"/>
            <asset:javascript src = "epilogue/util.js"/>
            <asset:javascript src = "epilogue/main.js"/>
            <asset:javascript src = "epilogue/jquery.scrollex.js"/>
            <asset:javascript src = "slider/slider.js"/>

            <script>

                $('#contactanos').click(function(e) 
                { 
                    $('html, body').animate(
                    {
                        scrollTop: $('#contacto').offset().top + 1000 - $(this).offset().top
                    }, 2000);                    
                });

            </script>
            
            <style>       

                #footer a, p { color: grey; }

                ul.icons li 
                {
                    display: inline-block;
                    padding: 0 4em 0 0;
                }

            </style>  

        </div>

    </body>

</html>