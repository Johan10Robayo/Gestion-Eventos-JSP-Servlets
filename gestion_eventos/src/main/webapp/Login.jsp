<%-- 
    Document   : Login
    Created on : 2/11/2020, 9:01:06 p. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.is.database.Controlador"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login.</title>
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
                     <a href="Registro.jsp">Registro</a>
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
                        <h1><center>Iniciar sesi&oacute;n.</center></h1>
                        <div class="container col-xs-12 cold-sm-11 col-md-11  col-lg-11 col-lg-offset-1"><br>
                            <%
                                String nombrerecinto = request.getParameter("nombrerecinto");
                                String cod_evento = request.getParameter("cod_evento");
                                String sillas = request.getParameter("sillas");
                            %>
                            
                            <!--EL ACTION DEBE SER DINAMICO-->
                            <form action="Controlador" method='post' onsubmit='return Login();'>
                                <center><i class="large material-icons">person</i></center>
                                
                                
                                 <!--AGREGADO POR SANTI-->
                                <%
                                    out.println("<input type='hidden' id='cod_evento' value='"+cod_evento+"' name='cod_evento'>");
                                    out.println("<input type='hidden' id='nombrerecinto' value='"+nombrerecinto+"' name='nombrerecinto'>");
                                    out.println("<input type='hidden' id='sillas' value='"+sillas+"' name='sillas'>");
                                %>
                                <!---->
                                <div class="form-group">
                                    <label for="nombre">Usuario:</label>
                                    <input class="form-control" type="text" name="usuario" id="usuario" placeholder="ingrese su usuario" required>
                                </div>

                                <div class="form-group">
                                    <label for="passlogin">Contrase&ntilde;a:</label>
                                    <input class="form-control" type="password" name="passlogin" id="passlogin" placeholder="ingrese su contrase&ntilde;a" required>
                                </div>
                                <div class="form-group">
                                    <!--<button class="btn active btn-block btn-primary">Ingresar.</button>-->
                                    <input class="btn btn-danger btn-block" type="submit" name="accion" value="Ingresar">
                                    <a class="contraolvidada" href="Registro.jsp">¿Olvidaste tu contrase&ntilde;a?</a>
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

