<html>

    <head>
        
        <meta name = "layout" content = "${gspLayout ?: 'main'}"/> <title> Login </title>

        <asset:stylesheet href = "login/bootstrap/css/bootstrap.min.css"/>
        <asset:stylesheet href = "login/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <asset:stylesheet href = "login/Linearicons-Free-v1.0.0/icon-font.min.css"/>
        <asset:stylesheet href = "login/animate/animate.css"/>
        <asset:stylesheet href = "login/css-hamburgers/hamburgers.min.css"/>
        <asset:stylesheet href = "login/animsition/css/animsition.min.css"/>
        <asset:stylesheet href = "login/select2/select2.min.css"/>
        <asset:stylesheet href = "login/daterangepicker/daterangepicker.css"/>
        <asset:stylesheet href = "login/util.css"/>
        <asset:stylesheet href = "login/main.css"/>

    </head>

    <body>

        <div class = "limiter">
            
            <div class = "container-login100">
                
                <div class = "wrap-login100">
                    
                    <g:if test = "${!params.registrarse}">

                        <form class = "login100-form validate-form" action = "${postUrl ?: '/login/authenticate'}" method = "POST" id = "loginForm" autocomplete = "off">
                            
                            <g:if test = "${flash.message && !params.login_error}"> 

                                <div class = "alert alert-success" style = "width: 100%"> El Usuario se ha registrado exitosamente. <button class = "close" data-dismiss = "alert">x</button> </div> 

                            </g:if>

                            <g:if test = "${params.login_error}">    

                                <div class = "alert alert-danger" style = "width: 100%"> Ha ocurrido un error con las credenciales. <button class = "close" data-dismiss = "alert">x</button> </div> 

                            </g:if>

                            <span class = "login100-form-title p-b-34"> Ingreso de Usuario </span>
                            
                            <div class = "wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate = "Ingrese el nombre de usuario">
                                
                                <input type = "text" class = "text_ input100" name = "${usernameParameter ?: 'username'}" id = "first-name" 
                                placeholder = "User name"/>

                                <span class = "focus-input100"> </span>

                            </div>

                            <div class = "wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate = "Ingrese la Contraseña">
                                
                                <input type = "password" class = "text_ input100" name = "${passwordParameter ?: 'password'}" id = "password" 
                                placeholder = "Contraseña"/>

                                <span class = "focus-input100"> </span>

                            </div>
                            
                            <input class = "login100-form-btn" type = "submit" id = "submit" value = "Ingresar"/>

                            <div class = "w-full text-center p-t-27 p-b-239">
                                
                                <a href = "/myapp/" class = "txt3"> <span> Volver </span> </a>

                            </div>

                            <div class = "w-full text-center"> <a href = "../login/auth?registrarse=registrarse" class = "txt3"> Registrarse </a> </div>

                        </form>

                    </g:if>

                    <g:else>

                        <form style = "margin-top:-10%" class = "login100-form validate-form" action = "save" controller = "Usuario" method = "POST" id = "loginForm" autocomplete = "off">

                            <span class = "login100-form-title p-b-34"> Registro de Usuario </span>
                            
                            <span style = "margin-right:20px"> Username: </span> 

                            <div class = "wrap-input100 rs1-wrap-input100 validate-input m-b-20" style = "margin-left:39px; " data-validate = "Ingrese el nombre de usuario">
                                
                                <input type="text" class="text_ input100" name = "${usernameParameter ?: 'username'}" id = "password" placeholder = "User name"/>

                                <span class = "focus-input100"> </span>

                            </div>
                            <span style = "margin-right:20px"> Contraseña: </span> 

                            <div class = "wrap-input100 rs1-wrap-input100 validate-input m-b-20" style = "margin-left:28px; " data-validate = "Ingrese el nombre de usuario">
                                
                                <input type = "password" class = "text_ input100" name = "${passwordParameter ?: 'password'}" id = "password" placeholder = "Contraseña"/>

                                <span class = "focus-input100"> </span>

                            </div>  
                            
                            <span style = "margin-right:20px"> Nombre: </span> 

                            <div class = "wrap-input100 rs1-wrap-input100 validate-input m-b-20" style = "margin-left:58px; " data-validate = "Ingrese el Nombre">
                                
                                <input type = "text" class = "text_ input100" name = "${usernameParameter ?: 'username'}" id = "password" placeholder = "Nombre"/>

                                <span class = "focus-input100"> </span>

                            </div>

                            <span style = "margin-right:20px"> Apellido: </span> 

                            <div class = "wrap-input100 rs1-wrap-input100 validate-input m-b-20" style = "margin-left:58px; " data-validate = "Ingrese el Apellido">
                                
                                <input type = "text" class = "text_ input100" name = "${usernameParameter ?: 'username'}" id = "password" placeholder = "Apellido"/>

                                <span class = "focus-input100"> </span>

                            </div>

                            <span style = "margin-right:30px"> Perfil: </span> 

                            <div class = "wrap-input100 rs1-wrap-input100 validate-input m-b-20" style = "margin-left:77px; " data-validate = "Ingrese el Perfil">
                                
                                <select style = "width:227px" name = "dept" id = "dept" required = "">
                                        
                                    <option value = ""> - Área - </option>
                                    <option value = "proveedor"> Proveedor </option>
                                    <option value = "productor"> Productor </option>

                                </select>

                                <span class = "focus-input100"> </span>

                            </div>    

                            <div class = "container-login100-form-btn" style = "margin-top: 10%">
                                
                                <button class = "login100-form-btn"> Registrarse </button>

                            </div>

                            <div class = "w-full text-center p-t-27 p-b-239">
                                
                                <a href = "/myapp/login/auth" class = "txt3"> <span> Volver </span> </a>

                            </div>

                        </form>

                    </g:else>
                        
                    <div class = "login100-more" 
                    style = "background-image:url('${resource(dir: "images", file: "login.jpg")}');> </div>

                </div>

            </div>

        </div>

        <div id = "dropDownSelect1"> </div>
        
        <asset:javascript src = "login/jquery/jquery-3.2.1.min.js" />
        <asset:javascript src = "login/animsition/js/animsition.min.js" />
        <asset:javascript src = "login/bootstrap/js/popper.js" />
        <asset:javascript src = "login/bootstrap/js/bootstrap.min.js" />
        <asset:javascript src = "login/select2/select2.min.js" />
        
        <script>
            
            $(".selection-2").select2({
                minimumResultsForSearch: 20,
                dropdownParent: $('#dropDownSelect1')
            });

            (function() { document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus(); })();

        </script>

        <asset:javascript src = "login/daterangepicker/moment.min.js" />
        <asset:javascript src = "login/daterangepicker/daterangepicker.js" />
        <asset:javascript src = "login/countdowntime/countdowntime.js" />
        <asset:javascript src = "login/main.js" />

        <style>       

            #footer { text-align: center; }

            #footer a { color: grey; font-size: 1.2em; }

            #footer .copyright { font-size: 1.2em; }

            ul.icons 
            {
                cursor: default;
                list-style: none;
                padding-left: -100px;
            }

            ul.icons li 
            {
                display: inline-block;
                padding: 2em 0 2em 0;
                font-size: 12px;
            }

        </style>

    </body> 

</html>