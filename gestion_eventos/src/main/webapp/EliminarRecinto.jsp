<%-- 
    Document   : EliminarRecinto
    Created on : 5/11/2020, 3:33:20 p. m.
    Author     : santi
--%>

<%@page import="com.is.modelo.Recinto"%>
<%@page import="com.is.database.MisConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR RECINTOS</title>
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

        <br><br><br>
    <center><h2>Eliminar recinto.</h2></center>

    <div class="container">
        <section class="main row">
            <div class="col-lg-12">	
                <div class="container">	
                    <!--PRIMERA FILA-->
                    <div class="container-fluid">

                        <%
                            MisConsultas misConsultas = new MisConsultas();

                            for (Recinto recinto : misConsultas.consultaRecinto()) {

                                out.println("<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>");
                                out.println("<form action='EliminarRecintoResultado.jsp' method='get' >");
                                out.println("<h4>" + recinto.getNombre() + "</h4>");

                                out.println("<center><input type='hidden'  value='" + recinto.getNombre() + "' name='nombrerecinto'></center>");
                                out.println("<center><label>ID:</label><input  disabled='disabled' value='" + recinto.getId() + "' name='idrecinto' ></center>");
                                out.println("<center><label>TIPO:</label><input disabled='disabled' value='" + recinto.getTipo() + "'></center>");

                                out.println("<center><input class='btn btn-info' type='SUBMIT' value='Eliminar recinto.'></center>");
                                out.println("</form>");
                                out.println("</div>");

                            }
                        %> 


                    </div>	
                </div>
            </div>
        </section>
    </div>
</body>
</html>
