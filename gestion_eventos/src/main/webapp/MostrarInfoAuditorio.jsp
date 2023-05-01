<%-- 
    Document   : MostrarInfoAuditorio
    Created on : 24/10/2020, 9:15:56 p. m.
    Author     : Windows 10
--%>

<%@page import="com.is.modelo.Recinto"%>
<%@page import="com.is.modelo.Funcion"%>
<%@page import="com.is.modelo.Evento"%>
<%@page import="com.is.database.MisConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Información auditorios.</title>
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
        <link rel="stylesheet" type="text/css" href="estilos/estilos_1.css">
    </head>
    <body class="fondo2">
        <header>
                <div class="contenedor">
                        <h1>EVENTOS COLOMBIA</h1>
                        <input type="checkbox" id="menu-bar">
                        <label class="icon-menu" for="menu-bar"></label>
                        <nav class="menu">
                                <a href="index.jsp">Inicio</a>
                                <a href="CarteleraTeatro.jsp">Cartelera teatro.</a>
                                <a href="CarteleraAuditorio.jsp">Cartelera auditorio</a>
                                <a href="Login.jsp">Login</a>
                                <a href="Registro.jsp">Registro</a>
                        </nav>
                         <%
                        HttpSession sesion = request.getSession();
                        if(session.getAttribute("user")!=null ){
                            if(session.getAttribute("user").equals("Inicie sesion")){
                                out.println("<label><a href='Login.jsp'>Inicie sesión</a></label>");
                            }else{
                                out.println("<label> <a href='Controlador?accion=Salir'>  Cerrar sesión   </a>  </label>");
                                out.println("<label>User: "+session.getAttribute("user") +" <label></label></label>");   
                            }
                        }
                        else{
                            session.setAttribute("user", "Inicie sesion");
                            String user = (String)session.getAttribute("user");
                            if(session.getAttribute("user").equals("Inicie sesion")){
                                out.println("<label><a href='Login.jsp'>Inicie sesión</a></label>");
                            }
                        }
                         %>
                </div>
        </header>
        <% int id_evento = Integer.parseInt(request.getParameter("id2")); %>
        
       
        
           <br><br>
        
        
        <div class="container">
            <section class="main row">
                <br><br>
                <center>
                <div class="contenedor1">
                    <article> 
                        <%  MisConsultas misConsultas = new MisConsultas();
                            int cod_evento = 0;
                            int cod_funcion = 0;
                            for (Evento event : misConsultas.consultaEventoTeatro(id_evento)) {%>
                             <h2><center><%= event.getNombre()%></center></h2><br>
                            <img class="img-responsive" src="<%= event.getPoster()%>" width="600" height="600"/>    
                        <% cod_evento = event.getId();%>
                        <br>
                        <p><b>Título:</b> <%= event.getNombre()%></p>
                        <p><b>Tematica:</b><%= event.getTematica()%></p>
                        <p><b>Precio:</b> <%= event.getPrecio()%></p>
                        <p><b>Duración:</b><%= event.getDuracion()%> minutos</p>
                        <p><b>Reparto:</b><%= event.getReparto()%></p>
                        <p><b>Director:</b><%= event.getDirector()%></p>
                        <p><b>Descripción:</b><%= event.getDescripcion()%></p>
                        <% }%>

                        <% for (Funcion funcion : misConsultas.consultaCrearFuncion(cod_evento)) {%>
                        <% cod_funcion = funcion.getId_recinto();%>
                        <!--<p><b>Fecha: </b><%= funcion.getFecha()%></p>-->
                        <!--<p><b>Hora: </b><%= funcion.getHora()%></p>-->

                        <% }%>
                        <br>
                        <form action="SillasAuditorio.jsp">
                             <p>Recinto:</p> <select name="sala">
                                <% int codigo_recinto = 0;
                                    
                                    for (Recinto recinto : misConsultas.consultaCrearRecinto(cod_evento)) {%>

                                <option><% 
                                    out.print(recinto.getNombre());
                                    
                                   %></option>
                                <br>
                                <% }%>
                            </select>
         
                            
                            <br>
                            <br><input type="submit" class='btn btn-info' value="Visualizar asientos">
                            <input type='hidden'  value='<%= cod_evento%>' name='codigo_evento' >
                            <br>
                            <br>
                        </form>
                    </article>

                </div>
                </center>
            </section>
        </div>
        
        
        
    </body>
</html>
