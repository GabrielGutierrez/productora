<!DOCTYPE html>

<html>
 
    <head>
        
        <meta name = "layout" content = "main" /> <title> Blog </title>

        <asset:stylesheet href = "menu/styles.css" /> <asset:stylesheet href = "epilogue/main.css"/>

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

                    <h1> Editando Artículo </h1>
            
                    <g:form resource = "${this.blog}" method = "PUT">
                        
                        <g:hiddenField name = "version" value = "${this.blog?.version}" />
                        
                        <fieldset class = "form" style = "margin-left:2.5%">

                            <br/> <div class = "field half first">
                                            
                                <label> Título </label>

                                <input name = "titulo" type = "text" placeholder = "Título del Artículo" required = "required" value = "${this.blog.titulo}">

                            </div> <br/>

                            <div class = "field half first">
                                
                                <label> Texto del Artículo </label>

                                <textArea name = "articulo" type = "text" required = "required"> ${this.blog.articulo} </textArea>

                            </div> <br/>
                        
                        </fieldset>

                        <input style = "margin-left: 40%; width:20%" class = "save" type = "submit" value = "Actualizar" />
                        
                    </g:form>

                </div> <br/>

            </section>

        </div>

    </body>

</html>