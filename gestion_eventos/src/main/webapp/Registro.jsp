<%-- 
    Document   : Registro
    Created on : 3/11/2020, 7:28:15 a. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Registro</title>
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
    <body class="fondologin">
        <header>
            <div class="contenedor">
                <h1>EVENTOS COLOMBIA</h1>
                <input type="checkbox" id="menu-bar">
                <label class="icon-menu" for="menu-bar"></label>
                <nav class="menu">
                    <a href="index.jsp">Inicio</a>
                    <a href="CarteleraTeatro.jsp">Cartelera teatro.</a>
                    <a href="CarteleraAuditorio.jsp">Cartelera auditorio</a>
                    <a href="Login.jsp">Iniciar sesi&oacute;n.</a>
                </nav>
            </div>
        </header>


        <section class="main">
            <br>
            <br>
            <br>
            <div class="contenedorform">
                <section class="main row">
                    <div class="col-lg-12">	
                        <h1><center>Registro usuario.</center></h1>
                        <div class="container col-xs-12 cold-sm-11 col-md-11  col-lg-11 col-lg-offset-1"><br>


                            <!--EL ACTION DEBE SER DINAMICO-->
                            <form action="InsertarUsuario.jsp" method='post' onsubmit='return Registrar();'>


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
                                    <label for="passlogin">Contrase&ntilde;a:</label>
                                    <input class="form-control" type="password" name="passregistro" id="passregistro" placeholder="ingrese su contrase&ntilde;a" required>
                                </div>
                                <div class="form-group">

                                    <input class="btn btn-danger btn-block" type="submit" name="accion" value="Ingresar">

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
