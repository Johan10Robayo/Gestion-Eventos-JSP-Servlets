<%-- 
    Document   : ActualizarEventoResultado
    Created on : 6/11/2020, 11:24:44 AM
    Author     : JOHAN
--%>
<%@page import="com.is.database.MisConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%MisConsultas misconsultas = new MisConsultas();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar evento.</title>
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
        <%
            String id_actualizado = request.getParameter("id_actualizado");
            String id = request.getParameter("id_actual");
            int id_actual = Integer.parseInt(id);
            int id_evento_actualizado = Integer.parseInt(id_actualizado);
            String nombre = request.getParameter("nombreevento");
            String tematica = request.getParameter("tematica");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int duracion = Integer.parseInt(request.getParameter("duracion"));
            String reparto = request.getParameter("reparto");
            String director = request.getParameter("director");
            String descripcion = request.getParameter("descripcion");

            boolean actualizacion = misconsultas.actualizar_evento(id_actual, id_evento_actualizado, nombre, tematica, precio, duracion, reparto, director, descripcion);


        %>

        <section class="main row">
            <div class="col-lg-12">
                <div class='contenedorform'>
                    <section class='main row'>
                        <div class='col-lg-12'>
                            <% if (actualizacion) {
                                    out.println("<h1>Evento " + request.getParameter("nombreevento") + " ACTUALIZADO CON ÉXITO</h1>");

                                } else {
                                    out.println("<h1>Error al actualizar el evento</h1>");
                               }%>
                        </div>
                    </section>
                </div>
                </body>
                </html>