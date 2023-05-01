<%-- 
    Document   : InsertarEvento
    Created on : 6/11/2020, 12:20:31 AM
    Author     : ADMIN
--%>

<%@page import="com.is.database.MisConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%MisConsultas misconsultas = new MisConsultas();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Evento.</title>
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
            String nombre_evento = request.getParameter("nombreevento");
            String tematica = request.getParameter("tematica");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int duracion = Integer.parseInt(request.getParameter("duracion"));
            String reparto = request.getParameter("reparto");
            String director = request.getParameter("director");
            String descripcion = request.getParameter("descripcion");
            String recinto = request.getParameter("nombrerecinto");
            String[] recinto1 = recinto.split("-");
            String nombre_recinto = recinto1[0];
            System.out.println(nombre_recinto);
            int id_recinto = misconsultas.consultar_id_recinto(nombre_recinto);
            System.out.println(id_recinto);

            System.out.println(nombre_evento);

            int id_silla = 50001;
            String fecha = "2020-11-27";
            String hora = "18:30:00";
            int valor = 20000;
            int id_login = 2;
            String poster = "imagenes/PosterDefecto.jpg";

            boolean insercion_evento = misconsultas.insertar_evento(nombre_evento, tematica, precio, duracion, reparto, director, descripcion, poster);
            int id_evento = misconsultas.consultar_id_evento(nombre_evento);
            System.out.println(id_evento);
            boolean insercion_funcion = misconsultas.insertar_funcion(fecha, hora, id_login, id_recinto, id_silla, id_evento, valor);
            System.out.println(insercion_funcion);

        %>

        <section class="main row">
            <div class="col-lg-12">	                 
                <div class='contenedorform'>

                    <section class='main row'>
                        <div class='col-lg-12'>
                            <%if (insercion_evento && insercion_funcion) {
                                    out.println("<h1>EVENTO " + nombre_evento + " CREADO CON ÉXITO</h1>");
                                } else {
                                    out.println("<h1>Error al crear el evento</h1>");
                                }%>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </body>
</html>
