<%-- 
    Document   : PanelConfiguraciones
    Created on : 5/11/2020, 12:36:39 p. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PANEL ADMIN.</title>
        <link rel="icon" type="image/jpg" href="imagenes/iconocaras.jpg">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport content="width=device-width,user-scalable=no,initial-scale=1, maximun-scale=1, minimum-scale=1">
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
                        <br>
                       
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
                
                <main>
            <section id="banner">
            <img src="imagenes/bannerAdmin.jpg"/>
                    <div class="contenedor">
                    <h2>PANEL DE ADMINISTRACIÓN.</h2>
                   
                   
                    </div>
            </section>
	</main>
    </body>
</html>
