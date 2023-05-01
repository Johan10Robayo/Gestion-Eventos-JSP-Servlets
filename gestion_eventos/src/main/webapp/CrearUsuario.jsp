<%-- 
    Document   : CrearUsuario
    Created on : 5/11/2020, 11:10:28 p. m.
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear usuario</title>
        <link rel="icon" type="image/jpg" href="imagenes/iconocaras.jpg">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="estilos/fontello.css"> 
        <link rel="stylesheet" href="estilos/estilos.css"> 
        <link rel="stylesheet" href="estilos/menu.css"> 
        <link rel="stylesheet" href="estilos/banner.css"> 
        <link rel="stylesheet" href="estilos/blog.css"> 
        <link rel="stylesheet" type="text/css" href="estilos/estilos_1.css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <div class="contenedor">
                <h1>PANEL ADMIN</h1>


                <input type="checkbox" id="menu-bar">
                <label class="icon-menu" for="menu-bar"></label>
                <nav class="menu">
                    <a href="PanelConfiguraciones.jsp">Inicio.</a>
                    <a href="ConfiguracionesRecinto.jsp">Configuraciones recinto.</a>
                    <a href="ConfiguracionesEvento.jsp">Configuraciones evento.</a>
                    <a href="ConfiguracionesUsuario.jsp">Configuraciones usuario.</a>
                    <a href="Login.jsp">Login.</a>

                </nav>
                <%
                    HttpSession sesion = request.getSession();
                    if (session.getAttribute("user") != null) {
                        if (session.getAttribute("user").equals("Inicie sesion")) {
                            out.println("<label><a href='Login.jsp'>Inicie sesión</a></label>");
                        } else {
                            out.println("<label> <a href='Controlador?accion=Salir'>  Cerrar sesión   </a>  </label>");
                            out.println("<label>User: " + session.getAttribute("user") + " <label></label></label>");
                        }
                    } else {
                        session.setAttribute("user", "Inicie sesion");
                        String user = (String) session.getAttribute("user");
                        if (session.getAttribute("user").equals("Inicie sesion")) {
                            out.println("<label><a href='Login.jsp'>Inicie sesión</a></label>");
                        }
                    }
                %>

            </div>
            <br><br>
        </header>

        <section class="main">
            <br>
            <br>
            <br>

            <div class="contenedorform">
                <section class="main row">
                    <div class="col-lg-12">                 
                        <div class="container col-xs-12 cold-sm-11 col-md-11  col-lg-11 col-lg-offset-1">

                            <form action="InsertarNuevoUsuario.jsp" method='post' onsubmit='return Registrar();'>
                                <center><h2>Crear usuario.</h2></center>
                                <div class="form-group">
                                    <label for="nombre">Nombres y apellidos:</label>
                                    <input class="form-control" type="text" name="nombresapel" id="nombresapel" placeholder="ingrese sus nombres y apellidos" required>
                                </div>
                                <div class="form-group">
                                    <label for="nombre">Correo electr&oacute;nico:</label>
                                    <input class="form-control" type="text" name="correo" id="correo" placeholder="ingrese su correo" required>
                                </div>

                                <div class="form-group">
                                    <label for="nombre">N&uacute;mero de documento:</label>
                                    <input class="form-control" type="number" min="0" name="numdocu" id="numdocu" placeholder="ingrese su n&uacute;mero de documento" required>
                                </div>


                                <div class="form-group">
                                    <label for="option">Tipo de documento:</label>
                                    <select class="form-control" name="tipodocu" id="tipodocumento">
                                        <option value="cedula">C&eacute;dula de ciudadan&iacute;a</option>
                                        <option value="cedula extranjeria">C&eacute;dula de extranjer&iacute;a</option>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label for="nombre">N&uacute;mero de celular:</label>
                                    <input class="form-control" type="number" min="0" name="celular" id="celular" placeholder="ingrese su n&uacute;mero de celular" required>
                                </div>
                                <!--PERSONAAAA-->

                                <div class="form-group">
                                    <label for="nombre">Nombre de usuario:</label>
                                    <input class="form-control" type="text" name="user" id="user" placeholder="ingrese su usuario" required>
                                </div>

                                <div class="form-group">
                                    <label for="option">Tipo de usuario:</label>
                                    <select class="form-control" name="tipouser" id="tipouser">
                                        <option value="vip">vip</option>
                                        <option value="normal">normal</option>
                                        <option value="admin">admin</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="passlogin">Contrase&ntilde;a:</label>
                                    <input class="form-control" type="password" name="passregistro" id="passregistro" placeholder="ingrese su contrase&ntilde;a" required>
                                </div>



                                <div class="form-group">

                                    <input class="btn btn-danger btn-block" type="submit" name="accion" value="Crear usuario">

                                </div><br>
                            </form>
                        </div>
                    </div>   
                </section>
            </div>	
            </br>
        </section>
    </body>
    <script src="js/expresionesreg.js"></script>
</html>
