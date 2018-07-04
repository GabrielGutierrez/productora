<!DOCTYPE html>

<html>

    <head>
        
        <meta name = "layout" content = "main" /> <title> Editando el Evento </title>

        <asset:stylesheet href = "epilogue/main.css"/> <asset:stylesheet href = "menu/styles.css" />

    </head>

    <body>
        
        <div id = "cssmenu">
                
            <ul>
               <li> <a href = "/myapp"> <span> Inicio </span> </a> </li>
               <li> <g:link action = "show" controller = "usuario" id = "${sec.loggedInUserInfo(field:'id')}"> Mi Perfil </g:link> </li>
               <li class = "active"> <g:link action = "index" controller = "listadoEventos"> Crear Evento </g:link> </li>
               <li> <a href = '#'> <span> Mira como ven tu Perfil </span> </a> </li>
               <li class = "last"> <g:link controller = "logout"> Salir </g:link> </li>
            </ul>

        </div>

        <div class = box>
            
            <g:form resource = "${this.listadoEventos}" method = "PUT">

                <section id = "contacto" class = "main" style = "background:white">
            
                    <div class = "content scaffold-show" role = "main">
                      
                        <article class = "item" style = "width:95%; margin-left: 2.5%"> 
                                        
                            <header> <a href = "#" > <asset:image src = "Contactanos.png" alt = ""/> </a> </header> 

                        </article>
                
                        <g:if test = "${flash.message}"> <div class = "message" role = "status"> ${flash.message} </div> </g:if>
                        
                        <h1> Editando el Evento </h1> <br/>

                        <g:hiddenField name = "version" value = "${this.listadoEventos?.version}" />
                        
                        <fieldset class = "form" style = "margin-left: 2.5%; width:95%"> 

                            <div class = "field half first">
                                                
                                <label> Nombre del Evento </label>

                                <input name = "nombre" type = "text" placeholder = "Nombre" required = "required" value = "${this.listadoEventos.nombre}">

                            </div> <br/> 

                            <div class = "field half first">
                                        
                                <label> Fecha del Evento </label>

                                <input name = "fecha" style = "width:100%" type = "date" required = "required" value = "${this.listadoEventos.fecha}">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Descripción</label> 

                                <input name = "descripcion" type = "text" placeholder = "Descripción" required = "required" value = "${this.listadoEventos.descripcion}">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Locación </label>

                                <input name = "locacion" type = "text" placeholder = "Locación" required = "required" value = "${this.listadoEventos.locacion}">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Hora Inicio </label>

                                <input name = "horaInicio" type = "text" placeholder = "Hora de Inicio" required = "required" value = "${this.listadoEventos.horaInicio}">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Hora Fin </label>

                                <input name = "horaFin" type = "text" placeholder = "Hora de Fin" required = "required" value = "${this.listadoEventos.horaFin}">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Nombre del Cliente </label>

                                <input name = "nombreCliente" type = "text" placeholder = "Nombre del Cliente" required = "required"value = "${this.listadoEventos.nombreCliente}">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Teléfono del Cliente </label>

                                <input name = "telefonoCliente" type = "text" placeholder = "Teléfono del Cliente" required = "required" value = "${this.listadoEventos.telefonoCliente}">

                            </div> <br/> 

                            <div class = "field half first">
                                                
                                <label> Correo del Cliente </label>

                                <input name = "correoCliente" type = "text" placeholder = "Correo del Cliente" required = "required" value = "${this.listadoEventos.correoCliente}">

                            </div> <br/> 

                        </fieldset>
                
                    </div>

                </section>

                <input  style = "margin-left: 35%; width:30%; margin-bottom: 50px; margin-top: 50px" class = "save" type = "submit" value = "Actualizar" />

            </g:form>

        </div>

    </body>

</html>