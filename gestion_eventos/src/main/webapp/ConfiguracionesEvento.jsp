<%-- 
    Document   : ConfiguracionesEvento
    Created on : 5/11/2020, 7:04:29 p. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONFIGURACIONES EVENTO</title>
        <link rel="icon" type="image/jpg" href="imagenes/iconocaras.jpg">
        <link rel="stylesheet" href="estilos/fontello.css"> 
        <link rel="stylesheet" href="estilos/estilos.css"> 
        <link rel="stylesheet" href="estilos/menu.css"> 
        <link rel="stylesheet" href="estilos/banner.css"> 
        <link rel="stylesheet" href="estilos/blog.css"> 

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
                    <a href="PanelConfiguraciones.jsp">Inicio</a>
                    <a href="ConfiguracionesRecinto.jsp">Configuraciones recinto.</a>
                    <a href="ConfiguracionesEvento.jsp">Configuraciones evento.</a>
                    <a href="ConfiguracionesUsuario.jsp">Configuraciones usuario.</a>
                    <a href="Login.jsp">Login</a>

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
        <br><br><br>
    <center><h2>Configuraciones eventos.</h2></center>


    <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>	
        <form action='CrearEvento.jsp'>
            <h4>Crear evento</h4>

            <img src='imagenes/CrearEvento.jpg' class='img-responsive img-rounded'/> 
            <center><ol></ol></center>
            <center><ol></ol></center>
            <input class='btn btn-info' type='SUBMIT' value='Crear.'>
        </form>
    </div>
    <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>	
        <form action='EliminarEvento.jsp'>
            <h4>Eliminar evento</h4>

            <img src='imagenes/EliminarEvento.jpg' class='img-responsive img-rounded'/> 
            <center><ol></ol></center>
            <center><ol></ol></center>
            <input class='btn btn-info' type='SUBMIT' value='Eliminar.'>
        </form>
    </div>
    <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>	
        <form action='ActualizarEvento.jsp'>
            <h4>Actualizar evento</h4>

            <img src='imagenes/ActualizarEvento.jpg' class='img-responsive img-rounded'/> 
            <center><ol></ol></center>
            <center><ol></ol></center>
            <input class='btn btn-info' type='SUBMIT' value='Actualizar.'>
        </form>
    </div>
    <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>	
        <form action='VisualizarEvento.jsp'>
            <h4>Visualizar eventos</h4>

            <img src='imagenes/VisualizarEventos.jpg' class='img-responsive img-rounded'/> 
            <center><ol></ol></center>
            <center><ol></ol></center>
            <input class='btn btn-info' type='SUBMIT' value='Visualizar.'>
        </form>
    </div>
    <br><br>
</body>
</html>
